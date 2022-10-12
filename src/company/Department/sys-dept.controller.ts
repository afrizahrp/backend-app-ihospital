import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { NewDataDto, ShowDataDto } from './sys-dept.dto';
import { SysDeptService } from './sys-dept.service';
import { ActiveUser, ActiveUserInfo, Public } from 'src/auth/decorators';
import { AuthGuard } from '@nestjs/passport';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';
import { UserInfo } from './../../users/sysUser/sys-User.decorator';
import { Roles } from 'src/auth/decorators/roles.decorator';

@Controller('dept/')
export class SysDeptController {
  constructor(private readonly sysDeptService: SysDeptService) {}

  @Public()
  @Get()
  getData(): Promise<ShowDataDto[]> {
    return this.sysDeptService.getAllData();
  }

  // // @UseGuards(AuthGuard('jwt-access'))
  // @Roles()
  @Public()
  @Post('new')
  newPatient(@Body() body: NewDataDto, @sysUser() sysUser: UserInfo) {
    try {
      return this.sysDeptService.newDataFields(
        body,
        sysUser.sub,
        sysUser.company_id,
        sysUser.branch_id,
      );
    } catch (error) {
      console.log(error.message);
    }
  }
}
