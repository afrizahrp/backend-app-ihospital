import { Test, TestingModule } from '@nestjs/testing';
import { HosRegistrationService } from './hos-registration.service';

describe('HosRegistrationService', () => {
  let service: HosRegistrationService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HosRegistrationService],
    }).compile();

    service = module.get<HosRegistrationService>(HosRegistrationService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
