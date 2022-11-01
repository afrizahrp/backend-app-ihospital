import { Module } from '@nestjs/common';
import { APP_GUARD } from '@nestjs/core';
import { AccessTokenGuard } from 'src/auth/authentication/guards';
import { PrismaModule } from '../../prisma/prisma.module';
import { UserController } from './user.controller';
import { UserService } from './user.service';

@Module({
  imports: [PrismaModule],
  controllers: [UserController],
  providers: [
    UserService,
    {
      provide: APP_GUARD,

      useClass: AccessTokenGuard,
    },
  ],
})
export class UserModule {}
