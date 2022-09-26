import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';

import { AuthModule } from './auth/authentication/auth.module';
import { SysUserModule } from './users/sysUser/sys-user.module';
import { APP_GUARD, APP_INTERCEPTOR } from '@nestjs/core';
import { AccessTokenGuard } from './auth/authentication/guards';
import { HosPatientModule } from './hospital/hos_Patient/hos-patient.module';
ConfigModule.forRoot();
@Module({
  imports: [PrismaModule, AuthModule, SysUserModule, HosPatientModule],
  controllers: [AppController],
  providers: [
    { provide: APP_INTERCEPTOR, useClass: AccessTokenGuard },
    AppService,
  ],
})
export class AppModule {}
