import { Controller, Get } from '@nestjs/common';
import { ShowDataDto } from './sys-user.dto';
import { SysUserService } from './sys-user.service';
import { Public } from 'src/auth/decorators';

@Controller('users/')
export class SysUserController {
  constructor(private readonly sysUserService: SysUserService) {}

  @Public()
  @Get()
  getData(): Promise<ShowDataDto[]> {
    return this.sysUserService.getAllData();
  }

  // get all data from sysUserService
  // @Get()
  // getAllData(): Promise<ShowDataDto[]> {
  //   return this.sysUserService.getAllData();
  // }
}
