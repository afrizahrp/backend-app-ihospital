/* eslint-disable prettier/prettier */
import { sysUserRole } from '@prisma/client';
import { Role } from './role.enum';
import { SetMetadata } from '@nestjs/common';
// export const Roles = (...roles: sysUserRole[]) => SetMetadata('roles', roles);
export const ROLES_KEY = 'roles';
export const Roles = (...roles: Role[]) => SetMetadata(ROLES_KEY, roles);

console.log(Roles);
