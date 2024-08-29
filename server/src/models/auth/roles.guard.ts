import { CanActivate, ExecutionContext, HttpException, HttpStatus, Injectable  } from "@nestjs/common";
import { Reflector } from "@nestjs/core";
import { JwtService } from "@nestjs/jwt";
import { Observable } from "rxjs";
import { ROLES_KEY } from "./rolesAuth.decorator";
import { ApiError } from "exceptions/api.error";


@Injectable()
export class RolesGuard implements CanActivate {

  constructor(
    private jwtService: JwtService,
    private reflector: Reflector
  ) {

  }

  canActivate(context: ExecutionContext): boolean | Promise<boolean> | Observable<boolean> {
    try {
      const requiredRoles = this.reflector.getAllAndOverride<string[]>(ROLES_KEY, [
        context.getHandler(),
        context.getClass()
      ])
      if(!requiredRoles) {
        return true
      }
      const req = context.switchToHttp().getRequest()
      const authHeader = req.headers.authorization
      const bearer = authHeader.split(' ')[0]
      const token = authHeader.split(' ')[1]

      if(bearer !== 'Bearer' || !token) {
        throw ApiError.UnauthorizedError()
      }

      const user = this.jwtService.verify(token)
      req.user = user
      console.log('user', user)
      const userData = user.roles.some(role => requiredRoles.includes(role.value))
      console.log('userData', userData);
      return userData

    } catch(e) {
      throw new HttpException({message: "No access"}, HttpStatus.FORBIDDEN)
    }
  }
  
}