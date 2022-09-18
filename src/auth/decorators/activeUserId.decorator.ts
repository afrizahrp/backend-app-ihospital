/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { JwtPayload } from '../authentication/types';

// export interface UserInfo {
//   id: string;
//   name: string;
//   exp: number;
// }

export const ActiveUserId = createParamDecorator(
  (data: undefined, context: ExecutionContext): string => {
    const request = context.switchToHttp().getRequest();
    const sysUser = request.sysUser as JwtPayload;
    return request.sysUser.sub;
  },
);
