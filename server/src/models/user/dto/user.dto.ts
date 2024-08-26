import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsNotEmpty, IsString, Length } from "class-validator";


export class UserDto {

  @ApiProperty({example: "user@gmail.com", description: "Почта пользователя"})
  @IsString({message: "Should be a string"})
  @IsEmail({}, {message: "Incorrect email"})
  readonly email: string;

  @ApiProperty({example: "cukenger", description: "Никнейм"})
  @IsNotEmpty()
  @Length(3, 16, {message: "Should be from 3 to 16 symbols"})
  @IsString({message: "Should be a string"})
  readonly username: string

  @ApiProperty({example: "qwerty", description: "Пароль пользователя"})
  @IsNotEmpty()
  @IsString({message: "Should be a string"})
  @Length(4, 16, {message: "Should be from 4 to 16 symbols"})
  readonly password: string
}