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
import { NewPatientDto } from './hos-patient.dto';
// import { CompanyType } from 'src/data/data';
import { HosPatientService } from './hos-patient.service';

@Controller('patient/')
export class HosPatientController {
  constructor(private readonly hosPatientService: HosPatientService) {}
  @Public()
  @Get()
  get_All() {
    return this.hosPatientService.get_All();
  }

  // @Post('/register')
  // register(@Body() body: RegisterDto) {
  //   try {
  //     // const doc_id = this.hosPatientService.get_Document_Id();
  //     return this.hosPatientService.register(body);
  //   } catch (error) {
  //     console.log(error.message);
  //   }
  // }

  @Public()
  @Post('register')
  register(@Body() body: NewPatientDto, @sysUser() sysUser) {
    try {
      return this.hosPatientService.insertPatient(body);
    } catch (error) {
      console.log(error.message);
    }
  }
}
