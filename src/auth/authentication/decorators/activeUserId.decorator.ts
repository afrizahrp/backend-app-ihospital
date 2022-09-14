/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { JwtPayload } from '../types';

// export interface UserInfo {
//   id: string;
//   name: string;
//   exp: number;
// }

export const ActiveUserId = createParamDecorator(
  (data: undefined, context: ExecutionContext): string => {
    const request = context.switchToHttp().getRequest();
    const user = request.user as JwtPayload;
    return request.user.sub;
  },
);
