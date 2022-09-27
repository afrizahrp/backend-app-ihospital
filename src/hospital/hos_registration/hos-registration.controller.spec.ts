import { Test, TestingModule } from '@nestjs/testing';
import { HosRegistrationController } from './hos-registration.controller';

describe('HosRegistrationController', () => {
  let controller: HosRegistrationController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HosRegistrationController],
    }).compile();

    controller = module.get<HosRegistrationController>(
      HosRegistrationController,
    );
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
