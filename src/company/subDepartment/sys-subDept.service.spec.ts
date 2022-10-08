import { Test, TestingModule } from '@nestjs/testing';
import { SysSubDeptService } from './sys-subDept.service';

describe('SysDeptService', () => {
  let service: SysSubDeptService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SysSubDeptService],
    }).compile();

    service = module.get<SysSubDeptService>(SysSubDeptService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
