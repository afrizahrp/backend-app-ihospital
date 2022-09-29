import { ClassSerializerInterceptor, Module } from '@nestjs/common';
import { APP_GUARD, APP_INTERCEPTOR } from '@nestjs/core';
import { PrismaModule } from '../../prisma/prisma.module';
import { HosPatientController } from './hos-patient.controller';
import { HosPatientService } from './hos-patient.service';
import { AccessTokenGuard } from './../../auth/authentication/guards/accessToken.guard';

@Module({
  imports: [PrismaModule],
  controllers: [HosPatientController],
  providers: [
    HosPatientService,
    {
      provide: APP_GUARD,

      useClass: AccessTokenGuard,
    },
  ],
})
export class HosPatientModule {}
