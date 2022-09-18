/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { JwtPayloadWithRefresh } from '../authentication/types/jwtPayloadWithRefresh';

export interface UserInfo {
  id: string;
  name: string;
  exp: number;
}

export const ActiveUser = createParamDecorator(
  (
    data: keyof JwtPayloadWithRefresh | undefined,
    context: ExecutionContext,
  ) => {
    const request = context.switchToHttp().getRequest();
    if (!data) return request.user;
    return request.user[data];
  },
);
