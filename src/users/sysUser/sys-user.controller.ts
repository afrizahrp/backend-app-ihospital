import { Controller, Get } from '@nestjs/common';
import { ShowDataDto } from './sys-user.dto';
import { SysUserService } from './sys-user.service';
import { Public } from 'src/auth/decorators';

@Controller('sysuser/')
export class SysUserController {
  constructor(private readonly sysUserService: SysUserService) {}

  @Public()
  @Get()
  gettingAll(): Promise<ShowDataDto[]> {
    return this.sysUserService.getAllData();
  }

  // get all data from sysUserService
  // @Get()
  // getAllData(): Promise<ShowDataDto[]> {
  //   return this.sysUserService.getAllData();
  // }
}
