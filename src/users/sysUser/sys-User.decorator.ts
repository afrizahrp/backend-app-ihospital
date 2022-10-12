/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export interface UserInfo {
  sub: string;
  name: string;
  exp: number;
  role_id: string;
  email: string;
  company_id: string;
  branch_id: string;
}

// export interface ActiveUserInfo {
//   sub: string;
//   name: string;
//   exp: number;
//   role_id: string;
//   email: string;
//   company_id: string;
//   branch_id: string;
// }

export const sysUser = createParamDecorator(
  (data, context: ExecutionContext) => {
    const request = context.switchToHttp().getRequest();
    return request.sysUser;
  },
);
