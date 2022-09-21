import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';

import { AuthController } from './auth/authentication/auth.controller';
import { AuthModule } from './auth/authentication/auth.module';
import { SysUserController } from './users/sysUser/sys-user.controller';
import { SysUserModule } from './users/sysUser/sys-user.module';
import { APP_GUARD, APP_INTERCEPTOR } from '@nestjs/core';
import { AccessTokenGuard } from './auth/authentication/guards';
import { HosPatientModule } from './hospital/hos_Patient/hos-patient.module';
import { SysUserInterceptor } from './users/sysUser/sys-User.interceptor';
ConfigModule.forRoot();
@Module({
  imports: [PrismaModule, AuthModule, SysUserModule, HosPatientModule],
  controllers: [AppController],
  providers: [
    AppService,
    { provide: APP_INTERCEPTOR, useClass: SysUserInterceptor },
  ],
})
export class AppModule {}
