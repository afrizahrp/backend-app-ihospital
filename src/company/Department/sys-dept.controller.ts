import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { NewDataDto, ShowDataDto } from './sys-dept.dto';
import { SysDeptService } from './sys-dept.service';
import { ActiveUser, ActiveUserInfo, Public } from 'src/auth/decorators';
import { AuthGuard } from '@nestjs/passport';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';
import { UserInfo } from './../../users/sysUser/sys-User.decorator';
import { Roles } from 'src/auth/decorators/roles.decorator';
import { sysUserRole } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { Role } from 'src/auth/decorators/role.enum';

@Controller('dept/')
export class SysDeptController {
  constructor(
    private readonly sysDeptService: SysDeptService,
    private readonly prismaService: PrismaService,
  ) {}

  @Public()
  @Get()
  getData(): Promise<ShowDataDto[]> {
    return this.sysDeptService.getAllData();
  }

  // @Roles(Role.Admin)
  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Post('new')
  newPatient(@Body() body: NewDataDto, @sysUser() sysUser: UserInfo) {
    try {
      return this.sysDeptService.newDataFields(body);
      //   ,
      //   sysUser.sub,
      //   sysUser.company_id,
      //   sysUser.branch_id,
      // );
    } catch (error) {
      console.log(error.message);
    }
  }
}
