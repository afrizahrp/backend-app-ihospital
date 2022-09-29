import { Test, TestingModule } from '@nestjs/testing';
import { HosAdmissionService } from './hos-admission.service';

describe('HosAdmissionService', () => {
  let service: HosAdmissionService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HosAdmissionService],
    }).compile();

    service = module.get<HosAdmissionService>(HosAdmissionService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
