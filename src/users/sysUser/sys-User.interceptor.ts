/* eslint-disable prettier/prettier */
import { CallHandler, ExecutionContext, NestInterceptor } from '@nestjs/common';
import * as jwt from 'jsonwebtoken';
import { JwtService } from '@nestjs/jwt';
export class SysUserInterceptor implements NestInterceptor {
  async intercept(context: ExecutionContext, handler: CallHandler) {
    const request = context.switchToHttp().getRequest();
    const token = request?.headers?.authorization?.split('Bearer ')[1];

    //wirte to content type json
    request.headers['content-type'] = 'application/json';

    const sysUser = await jwt.decode(token);
    request.sys_User = sysUser;

    return handler.handle();
  }
}
