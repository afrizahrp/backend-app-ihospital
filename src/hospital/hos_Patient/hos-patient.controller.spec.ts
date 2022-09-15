import { Test, TestingModule } from '@nestjs/testing';
import { HosPatientController } from './hos-patient.controller';

describe('Hos_Patient_Controller', () => {
  let controller: HosPatientController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HosPatientController],
    }).compile();

    controller = module.get<HosPatientController>(HosPatientController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
