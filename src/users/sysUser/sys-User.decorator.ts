/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export interface UserInfo {
  sub: string;
  role: string;
  username: string;
  company_id: string;
  branch_id: string;
  exp: number;
}

export const sysUser = createParamDecorator(
  (data, context: ExecutionContext) => {
    const request = context.switchToHttp().getRequest();
    return request.sysUser;
  },
);
