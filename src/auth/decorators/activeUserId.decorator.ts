/* eslint-disable prettier/prettier */
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { JwtPayload } from '../authentication/types';

export const ActiveUserId = createParamDecorator(
  (data: undefined, context: ExecutionContext): string => {
    const request = context.switchToHttp().getRequest();
    const user = request.user as JwtPayload;

    return user.sub;
  },
);
