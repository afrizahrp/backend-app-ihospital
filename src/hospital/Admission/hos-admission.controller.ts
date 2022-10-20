/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */
import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

import { ActiveUser, Public, ActiveUserInfo } from 'src/auth/decorators';
// import { sysUser, UserInfo } from 'src/users/sysUser/sys-User.decorator';
import { NewDataDto, ShowDataDto, UpdateDataDto } from './hos-admission.dto';
// import { CompanyType } from 'src/data/data';
import { HosAdmissionService } from './hos-admission.service';

@Controller('admission/')
export class HosAdmissionController {
  constructor(private readonly hosAdmissionService: HosAdmissionService) {}

  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Post('new')
  inserting(@Body() body: NewDataDto, @ActiveUser() sysUser: ActiveUserInfo) {
    try {
      return this.hosAdmissionService.newDataFields(
        body,
        sysUser.sub,
        sysUser.company_id,
        sysUser.branch_id,
      );
    } catch (error) {
      console.log(error.message);
    }
  }

  @Public()
  @Get()
  gettingAll(): Promise<ShowDataDto[]> {
    return this.hosAdmissionService.getAllData();
  }

  @Public()
  @Get(':id')
  gettingOneById(@Param('id') id: string) {
    return this.hosAdmissionService.getDataById(id);
  }

  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Put(':id')
  updating(
    @Param('id') id: string,
    @Body() body: UpdateDataDto,
    @ActiveUser() sysUser: ActiveUserInfo,
  ) {
    return this.hosAdmissionService.updateDataFields(
      id,
      body,
      sysUser.sub,
      sysUser.company_id,
      sysUser.branch_id,
    );
  }

  @Public()
  @Delete(':id')
  deleting(@Param('id') id: string) {
    return this.hosAdmissionService.deleteData(id);
  }
}
