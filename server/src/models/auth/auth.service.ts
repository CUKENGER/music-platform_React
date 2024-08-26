import { HttpException, HttpStatus, Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import * as uuid from 'uuid';
import { TokenService } from '../token/token.service';
import { MailService } from './mail.service';
import { RegUserDto } from 'models/user/dto/regUser.dto';
import { UserService } from 'models/user/user.service';
import { PrismaService } from 'prisma/prisma.service';
import { LoginUserDto } from 'models/user/dto/loginUser.dto';
import { User } from '@prisma/client';
import { UserDto } from 'models/user/dto/user.dto';

export interface RegUserResponse{
  accessToken: string,
  refreshToken: string,
  user: RegUserDto
}

@Injectable()
export class AuthService {

  constructor(
    private userService: UserService,
    private tokenService: TokenService,
    private mailService: MailService,
    private prisma: PrismaService
  ) {}

  async login(dto: LoginUserDto) {
    const user = await this.prisma.user.findUnique({ where: { email: dto.email } });
    if (!user) {
      throw new HttpException('User with this email not found', HttpStatus.BAD_REQUEST);
    }

    const isPassEquals = await bcrypt.compare(dto.password, user.password);
    if (!isPassEquals) {
      throw new HttpException('Incorrect password', HttpStatus.BAD_REQUEST);
    }

    const userDto = new RegUserDto(user);
    const tokens = this.tokenService.generateTokens({ ...userDto });
    await this.tokenService.saveToken(userDto.id, tokens.refreshToken, tokens.accessToken, this.prisma);

    return {
      ...tokens,
      user: userDto,
    };
  }

  async registration(dto: UserDto): Promise<RegUserResponse> {
    return await this.prisma.$transaction(async (prisma) => {
      const candidate = await this.userService.getByEmail(dto.email);
      if (candidate) {
        throw new HttpException("User with this email already exists", HttpStatus.BAD_REQUEST);
      }

      const candidateUsername = await this.userService.getByUsername(dto.username);
      if (candidateUsername) {
        throw new HttpException("User with this username already exists", HttpStatus.BAD_REQUEST);
      }

      const hashPassword = await bcrypt.hash(dto.password, 10);
      const activationLink = uuid.v4();

      const user = await prisma.user.create({
        data: {
          email: dto.email,
          password: hashPassword,
          activationLink,
          username: dto.username,
          isActivated: false,
        },
      });

      await this.mailService.sendActivationMail(dto.email, `${process.env.API_URL}/auth/activate/${activationLink}`);

      const userDto = new RegUserDto(user);
      const tokens = this.tokenService.generateTokens({ ...userDto });
      await this.tokenService.saveToken(userDto.id, tokens.refreshToken, tokens.accessToken, this.prisma);

      return {
        ...tokens,
        user: userDto,
      };
    });
  }

  async logout(refreshToken: string) {
    return await this.tokenService.removeToken(refreshToken);
  }

  async activate(activationLink: string) {
    const user = await this.prisma.user.findFirst({ where: { activationLink } });
    if (!user) {
      throw new HttpException('Error in activate, incorrect activation link', HttpStatus.BAD_REQUEST);
    }

    return await this.prisma.user.update({
      where: { id: user.id },
      data: { isActivated: true },
    });
  }

  async refresh(refreshToken: string) {
    if (!refreshToken) {
      throw new UnauthorizedException('Refresh token is missing');
    }

    const tokenData = this.tokenService.validateRefreshToken(refreshToken);
    const tokenFromDb = await this.tokenService.findToken(refreshToken);

    if (!tokenData || !tokenFromDb) {
      throw new UnauthorizedException('Invalid refresh token');
    }

    const user = await this.prisma.user.findUnique({ where: { id: tokenData.id } });
    if (!user) {
      throw new UnauthorizedException('User not found');
    }

    const userDto = new RegUserDto(user);
    const tokens = this.tokenService.generateTokens({ ...userDto });
    await this.tokenService.saveToken(userDto.id, tokens.refreshToken, tokens.accessToken, this.prisma);

    return {
      ...tokens,
      user: userDto,
    };
  }
}