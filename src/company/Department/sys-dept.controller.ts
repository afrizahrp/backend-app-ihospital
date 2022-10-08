import { Controller, Get } from '@nestjs/common';
import { ShowDataDto } from './sys-dept.dto';
import { SysDeptService } from './sys-dept.service';
import { Public } from 'src/auth/decorators';

@Controller('dept/')
export class SysDeptController {
  constructor(private readonly sysDeptService: SysDeptService) {}

  @Public()
  @Get()
  getData(): Promise<ShowDataDto[]> {
    return this.sysDeptService.getAllData();
  }
}
