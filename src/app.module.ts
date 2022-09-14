import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
// import { UsersModule } from './users/users.module';
// import { AuthModule } from './auth/auth.module';

import { AuthController } from './auth/authentication/auth.controller';
import { AuthModule } from './auth/authentication/auth.module';
import { SysUserController } from './users/sysUser/sys-user.controller';
import { SysUserModule } from './users/sysUser/sys-user.module';
import { APP_GUARD } from '@nestjs/core';
import { AccessTokenGuard } from './auth/authentication/guards';
ConfigModule.forRoot();
@Module({
  imports: [AuthModule, PrismaModule],
  controllers: [AuthController, SysUserController],
  providers: [{ provide: APP_GUARD, useClass: AccessTokenGuard }, AppService],
})
export class AppModule {}
