/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */
import {
  IsString,
  IsNotEmpty,
  IsDate,
  IsNumber,
  IsOptional,
  IsBoolean,
} from 'class-validator';
import { Exclude } from 'class-transformer';
import { ToBoolean } from 'src/toBoolean';

export class NewDataDto {
  // @Exclude()
  // @IsString()
  // @IsNotEmpty()
  // id: string;

  @IsString()
  @IsNotEmpty()
  trxType: string;

  @ToBoolean()
  @IsNotEmpty()
  isEmergency?: boolean;

  @IsString()
  @IsNotEmpty()
  emergency_id?: string;

  @ToBoolean()
  @IsNotEmpty()
  isAppointment?: boolean;

  @IsString()
  @IsNotEmpty()
  appointment_id?: string;

  @ToBoolean()
  @IsNotEmpty()
  isInsurance?: boolean;

  @IsString()
  @IsNotEmpty()
  insurance_id?: string;

  @IsDate()
  @IsNotEmpty()
  admissionDate: Date;

  @IsString()
  @IsNotEmpty()
  patient_id: string;

  @IsString()
  @IsNotEmpty()
  patientName: string;

  @IsString()
  @IsNotEmpty()
  patientCase: string;

  @ToBoolean()
  @IsNotEmpty()
  isRefer: boolean;

  @IsString()
  @IsNotEmpty()
  ref_id: string;

  @IsNumber()
  @IsNotEmpty()
  payType: number;

  @IsString()
  @IsNotEmpty()
  pay_id?: string;

  @IsNumber()
  @IsNotEmpty()
  status: number;
}

//generate dto for show Registration
export class ShowDataDto {
  id: string;

  trxType: string;

  isEmergency: boolean;

  emergency_id: string;

  isAppointment: boolean;

  appointment_id: string;

  isInsurance: boolean;

  insurance_id: string;

  admissionDate: Date;

  patient_id: string;

  patientName: string;

  patientCase: string;

  isRefer: boolean;

  ref_id: string;

  payType: number;

  pay_id: string;

  status: number;

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
  @ToBoolean()
  @IsNotEmpty()
  isEmergency: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  emergency_id: string;

  @IsOptional()
  @ToBoolean()
  @IsNotEmpty()
  isAppointment: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  appointment_id: string;

  @IsOptional()
  @ToBoolean()
  @IsNotEmpty()
  isInsurance: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  insurance_id: string;

  @IsOptional()
  @IsDate()
  @IsNotEmpty()
  admissionDate: Date;

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
  @ToBoolean()
  @IsNotEmpty()
  isRefer: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  ref_id: string;

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
