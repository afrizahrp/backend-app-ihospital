import { Module } from '@nestjs/common';
import { APP_GUARD } from '@nestjs/core';
import { AccessTokenGuard } from 'src/auth/authentication/guards';
import { PrismaModule } from './../../prisma/prisma.module';
import { SysUserController } from './sys-user.controller';
import { SysUserService } from './sys-user.service';

@Module({
  imports: [PrismaModule],
  controllers: [SysUserController],
  providers: [
    SysUserService,
    {
      provide: APP_GUARD,

      useClass: AccessTokenGuard,
    },
  ],
})
export class SysUserModule {}
