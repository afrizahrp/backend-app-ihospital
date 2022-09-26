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
  HttpCode,
  ParseUUIDPipe,
  ParseEnumPipe,
} from '@nestjs/common';
import { json } from 'express';
import { Public } from 'src/auth/decorators';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';
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

  @Public()
  @Post('register')
  register(@Body() body: NewPatientDto, @sysUser() sysUser) {
    try {
      return this.hosPatientService.newPatient(body);
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

  @Public()
  @Put(':id')
  update_Patient(@Param('id') id: string, @Body() body: UpdatePatientDto) {
    return this.hosPatientService.update_Patient_ById(id, body);
  }
}
