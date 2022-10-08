import { Test, TestingModule } from '@nestjs/testing';
import { SysSubDeptController } from './sys-subDept.controller';

describe('SysSubDeptController', () => {
  let controller: SysSubDeptController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SysSubDeptController],
    }).compile();

    controller = module.get<SysSubDeptController>(SysSubDeptController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
