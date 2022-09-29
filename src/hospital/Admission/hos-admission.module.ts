import { ClassSerializerInterceptor, Module } from '@nestjs/common';
import { APP_INTERCEPTOR, APP_GUARD } from '@nestjs/core';
import { PrismaModule } from '../../prisma/prisma.module';
import { HosAdmissionController } from './hos-admission.controller';
import { HosAdmissionService } from './hos-admission.service';
import { AccessTokenGuard } from './../../auth/authentication/guards/accessToken.guard';

@Module({
  imports: [PrismaModule],
  controllers: [HosAdmissionController],
  providers: [
    HosAdmissionService,
    {
      provide: APP_GUARD,

      useClass: AccessTokenGuard,
    },
  ],
})
export class HosAdmissionModule {}
