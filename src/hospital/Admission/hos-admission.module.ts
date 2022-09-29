import { Module } from '@nestjs/common';
import { HosAdmissionController } from './hos-admission.controller';

@Module({
  controllers: [HosAdmissionController],
})
export class HosAdmissionModule {}
