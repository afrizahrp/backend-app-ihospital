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
import { NewDataDto, ShowDataDto, UpdateDataDto } from './hos-patient.dto';
// import { CompanyType } from 'src/data/data';
import { HosPatientService } from './hos-patient.service';

@Controller('patient/')
export class HosPatientController {
  constructor(private readonly hosPatientService: HosPatientService) {}

  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Post('new')
  newPatient(@Body() body: NewDataDto, @ActiveUser() sysUser: ActiveUserInfo) {
    try {
      return this.hosPatientService.newDataFields(
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
  getPatients(): Promise<ShowDataDto[]> {
    return this.hosPatientService.getAllData();
  }

  @Public()
  @Get(':id')
  getOne(@Param('id') id: string) {
    return this.hosPatientService.getDataById(id);
  }

  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Put(':id')
  update_Patient(
    @Param('id') id: string,
    @Body() body: UpdateDataDto,
    @ActiveUser() sysUser: ActiveUserInfo,
  ) {
    return this.hosPatientService.updateDataFields(
      id,
      body,
      sysUser.sub,
      sysUser.company_id,
      sysUser.branch_id,
    );
  }

  @Public()
  @Delete(':id')
  delete_Patient(@Param('id') id: string) {
    return this.hosPatientService.deleteData(id);
  }
}
