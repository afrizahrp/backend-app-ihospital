import { Controller, Get } from '@nestjs/common';
import { ShowDataDto } from './sys-subDept.dto';
import { SysSubDeptService } from './sys-subDept.service';
import { Public } from 'src/auth/decorators';

@Controller('subdept/')
export class SysSubDeptController {
  constructor(private readonly sysSubDeptService: SysSubDeptService) {}

  @Public()
  @Get()
  getData(): Promise<ShowDataDto[]> {
    return this.sysSubDeptService.getAllData();
  }
}
