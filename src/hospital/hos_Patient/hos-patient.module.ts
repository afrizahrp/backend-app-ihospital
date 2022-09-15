import { ClassSerializerInterceptor, Module } from '@nestjs/common';
import { APP_INTERCEPTOR } from '@nestjs/core';
import { PrismaModule } from '../../prisma/prisma.module';
import { HosPatientController } from './hos-patient.controller';
import { HosPatientService } from './hos-patient.service';
import { AppService } from '../../app.service';

@Module({
  imports: [PrismaModule],
  controllers: [HosPatientController],
  providers: [
    AppService,
    HosPatientService,
    {
      provide: APP_INTERCEPTOR,

      useClass: ClassSerializerInterceptor,
    },
  ],
})
export class HosPatientModule {}
