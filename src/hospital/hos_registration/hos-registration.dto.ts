/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */
import {
  IsString,
  IsNotEmpty,
  IsEmail,
  MinLength,
  MaxLength,
  Matches,
  IsDate,
  IsNumber,
  IsOptional,
  IsBoolean,
  isString,
  isNumber,
} from 'class-validator';
import { Exclude } from 'class-transformer';
import { isDate } from 'util/types';

export class NewDataDto {
  @IsString()
  @IsNotEmpty()
  trxType: string;

  @IsBoolean()
  @IsNotEmpty()
  isEmergency: boolean;

  @IsString()
  @IsNotEmpty()
  emergency_id: string;

  @IsBoolean()
  @IsNotEmpty()
  isAppointment: boolean;

  @IsString()
  @IsNotEmpty()
  appointment_id: string;

  @IsBoolean()
  @IsNotEmpty()
  isInsurance: boolean;

  @IsString()
  @IsNotEmpty()
  insurance_id: string;

  @IsString()
  @IsNotEmpty()
  id: string;

  @IsDate()
  @IsNotEmpty()
  registryDate: Date;

  @IsString()
  @IsNotEmpty()
  patient_id: string;

  @IsString()
  @IsNotEmpty()
  patientName: string;

  @IsString()
  @IsNotEmpty()
  patientCase: string;

  @IsBoolean()
  @IsNotEmpty()
  isrefer: boolean;

  @IsString()
  @IsNotEmpty()
  ref_id: string;

  @IsString()
  @IsNotEmpty()
  referredCase: string;

  @IsDate()
  @IsNotEmpty()
  referredDate: string;

  @IsString()
  @IsNotEmpty()
  referredFrom: string;

  @IsString()
  @IsNotEmpty()
  fromPoly_id: string;

  @IsString()
  @IsNotEmpty()
  fromPolyName: string;

  @IsString()
  @IsNotEmpty()
  fromDoctor_id: string;

  @IsString()
  @IsNotEmpty()
  fromDoctorName: string;

  @IsString()
  @IsNotEmpty()
  toDoctor_id: string;

  @IsString()
  @IsNotEmpty()
  toDoctorName: string;

  @IsNumber()
  @IsNotEmpty()
  payType: number;

  @IsString()
  @IsNotEmpty()
  pay_id: string;

  @IsNumber()
  @IsNotEmpty()
  status: number;
}

//generate dto for show Registration
export class ShowDataDto {
  id: string;

  nickName: string;

  fullName: string;

  birthDate: Date;

  ageInYear: number;

  ageInMonth: number;

  gender: string;

  religion: string;

  bloodType: string;

  maritalStatus: string;

  country_id: string;

  prov_id: string;

  provName: string;

  subProv_id: string;

  subProvName: string;

  district_id: string;

  districtName: string;

  subdistrict_id: string;

  subdistrictName: string;
  address: string;

  mobileNo1: string;

  mobileNo2: string;

  phoneNo: string;
  email: string;

  occupation: string;

  @Exclude()
  createdBy: string;

  @Exclude()
  createdAt: Date;

  @Exclude()
  updatedBy: string;

  @Exclude()
  updatedAt: Date;

  @Exclude()
  company_id: string;

  @Exclude()
  branch_id: string;

  constructor(partial: Partial<ShowDataDto>) {
    Object.assign(this, partial);
  }
}

//generate update Registration dto
export class UpdateDataDto {
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  trxType: string;

  @IsOptional()
  @IsBoolean()
  @IsNotEmpty()
  isEmergency: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  emergency_id: string;

  @IsOptional()
  @IsBoolean()
  @IsNotEmpty()
  isAppointment: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  appointment_id: string;

  @IsOptional()
  @IsBoolean()
  @IsNotEmpty()
  isInsurance: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  insurance_id: string;

  @IsOptional()
  @IsDate()
  @IsNotEmpty()
  registryDate: Date;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  patient_id: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  patientName: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  patientCase: string;

  @IsOptional()
  @IsBoolean()
  @IsNotEmpty()
  isrefer: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  ref_id: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  referredCase: string;

  @IsOptional()
  @IsDate()
  @IsNotEmpty()
  referredDate: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  referredFrom: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  fromPoly_id: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  fromPolyName: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  fromDoctor_id: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  fromDoctorName: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  toDoctor_id: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  toDoctorName: string;

  @IsOptional()
  @IsNumber()
  @IsNotEmpty()
  payType: number;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  pay_id: string;

  @IsOptional()
  @IsNumber()
  @IsNotEmpty()
  status: number;
}
