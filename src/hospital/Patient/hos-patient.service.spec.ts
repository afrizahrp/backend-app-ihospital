import { Test, TestingModule } from '@nestjs/testing';
import { HosPatientService } from './hos-patient.service';

describe('HosPatientService', () => {
  let service: HosPatientService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HosPatientService],
    }).compile();

    service = module.get<HosPatientService>(HosPatientService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
