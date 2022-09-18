/* eslint-disable prettier/prettier */
import { sysUserRole } from '@prisma/client';
import { SetMetadata } from '@nestjs/common';
export const Roles = (...roles: sysUserRole[]) => SetMetadata('roles', roles);
