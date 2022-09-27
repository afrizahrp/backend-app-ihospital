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
import {
  NewPatientDto,
  ShowPatientDto,
  UpdatePatientDto,
} from './hos-patient.dto';
// import { CompanyType } from 'src/data/data';
import { HosPatientService } from './hos-patient.service';

@Controller('patient/')
export class HosPatientController {
  constructor(private readonly hosPatientService: HosPatientService) {}

  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Post('register')
  newPatient(
    @Body() body: NewPatientDto,
    @ActiveUser() sysUser: ActiveUserInfo,
  ) {
    try {
      return this.hosPatientService.newPatient(
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
  getPatients(): Promise<ShowPatientDto[]> {
    return this.hosPatientService.getPatients();
  }

  @Public()
  @Get(':id')
  getOne(@Param('id') id: string) {
    return this.hosPatientService.get_Patient_ById(id);
  }

  @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Put(':id')
  update_Patient(
    @Param('id') id: string,
    @Body() body: UpdatePatientDto,
    @ActiveUser() sysUser: ActiveUserInfo,
  ) {
    return this.hosPatientService.update_Patient_ById(
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
    return this.hosPatientService.delete_Patient_ById(id);
  }
}
