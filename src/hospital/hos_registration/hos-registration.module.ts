import { Module } from '@nestjs/common';
import { HosRegistrationController } from './hos-registration.controller';

@Module({
  controllers: [HosRegistrationController],
})
export class HosregistrationModule {}
