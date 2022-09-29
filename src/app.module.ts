import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';

import { AuthModule } from './auth/authentication/auth.module';
import { SysUserModule } from './users/sysUser/sys-user.module';
import { APP_GUARD } from '@nestjs/core';
import { AccessTokenGuard } from './auth/authentication/guards';
import { HosPatientModule } from './hospital/Patient/hos-patient.module';
// import { SysUserInterceptor } from './users/sysUser/sys-User.interceptor';
import { HosAdmissionModule } from './hospital/Admission/hos-admission.module';
import { HosAdmissionService } from './hospital/Admission/hos-admission.service';
ConfigModule.forRoot();
@Module({
  imports: [
    PrismaModule,
    AuthModule,
    SysUserModule,
    HosPatientModule,
    HosAdmissionModule,
  ],
  controllers: [AppController],
  providers: [
    // { provide: APP_INTERCEPTOR, useClass: SysUserInterceptor },
    { provide: APP_GUARD, useClass: AccessTokenGuard },
    AppService,
    HosAdmissionService,
  ],
})
export class AppModule {}

//Code below is worked fine
//  providers: [{ provide: APP_GUARD, useClass: AccessTokenGuard }, AppService],
