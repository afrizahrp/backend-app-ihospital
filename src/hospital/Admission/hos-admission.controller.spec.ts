import { Test, TestingModule } from '@nestjs/testing';
import { HosAdmissionController } from './hos-admission.controller';

describe('HosAdmissionController', () => {
  let controller: HosAdmissionController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HosAdmissionController],
    }).compile();

    controller = module.get<HosAdmissionController>(HosAdmissionController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
