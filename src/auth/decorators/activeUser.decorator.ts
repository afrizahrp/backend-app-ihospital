/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { JwtPayloadWithRefresh } from '../authentication/types/jwtPayloadWithRefresh';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';

export interface ActiveUserInfo {
  sub: string;
  name: string;
  exp: number;
  role_id: string;
  email: string;
  company_id: string;
  branch_id: string;
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
