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
} from 'class-validator';
import { Exclude } from 'class-transformer';

export class NewPatientDto {
  @IsString()
  @IsNotEmpty()
  nickName: string;

  @IsString()
  @IsNotEmpty()
  fullName: string;

  @IsDate()
  @IsNotEmpty()
  birthDate: Date;

  @IsNumber()
  ageInYear: number;

  @IsNumber()
  ageInMonth: number;

  @IsString()
  @IsNotEmpty()
  gender: string;

  @IsString()
  @IsNotEmpty()
  religion: string;

  @IsString()
  @IsNotEmpty()
  bloodType: string;

  @IsString()
  @IsNotEmpty()
  maritalStatus: string;

  @IsString()
  @IsNotEmpty()
  country_id: string;

  @IsString()
  @IsNotEmpty()
  prov_id: string;

  @IsString()
  @IsNotEmpty()
  provName: string;

  @IsString()
  @IsNotEmpty()
  subProv_id: string;

  @IsString()
  @IsNotEmpty()
  subProvName: string;

  @IsString()
  @IsNotEmpty()
  district_id: string;

  @IsString()
  @IsNotEmpty()
  districtName: string;

  @IsString()
  @IsNotEmpty()
  subdistrict_id: string;

  @IsString()
  @IsNotEmpty()
  subdistrictName: string;

  @IsString()
  @IsNotEmpty()
  address: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(20)
  @Matches(
    /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
    {
      message: 'Invalid mobil phone 1 number format',
    },
  )
  mobileNo1: string;

  @IsString()
  @MinLength(5)
  @MaxLength(20)
  @Matches(
    /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
    {
      message: 'Invalid mobil phone 2 number format',
    },
  )
  mobileNo2: string;

  @IsString()
  phoneNo: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(80)
  @IsEmail()
  email: string;

  @IsString()
  occupation: string;

  // @IsString()
  // createdBy: string;

  // @IsString()
  // updatedBy: string;

  // @IsDate()
  // @IsNotEmpty()
  // createdAt: Date;

  // @IsDate()
  // @IsNotEmpty()
  // updatedAt: Date;

  // @IsString()
  // company_id: string;

  // @IsString()
  // branch_id: string;
}

//generate dto for show patient
export class ShowPatientDto {
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

  constructor(partial: Partial<ShowPatientDto>) {
    Object.assign(this, partial);
  }
}

//generate update patient dto
export class UpdatePatientDto {
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  nickName?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  fullName?: string;

  @IsOptional()
  @IsDate()
  @IsNotEmpty()
  birthDate?: Date;

  @IsOptional()
  @IsNumber()
  ageInYear?: number;

  @IsOptional()
  @IsNumber()
  ageInMonth?: number;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  gender?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  religion?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  bloodType?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  maritalStatus?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  country_id?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  prov_id?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  provName?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  subProv_id?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  subProvName?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  district_id?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  districtName?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  subdistrict_id?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  subdistrictName?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  address?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(20)
  @Matches(
    /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
    {
      message: 'Invalid main mobil phone number format',
    },
  )
  mobileNo1?: string;

  @IsOptional()
  @IsString()
  @MinLength(5)
  @MaxLength(20)
  @Matches(
    /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
    {
      message: 'Invalid additional mobil phone number format',
    },
  )
  mobileNo2?: string;

  @IsOptional()
  @IsString()
  phoneNo?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(80)
  @IsEmail()
  email?: string;

  @IsOptional()
  @IsString()
  occupation?: string;

  // @IsOptional()
  // @Exclude()
  // @IsString()
  // createdBy?: string;

  // @IsString()
  // updatedBy?: string;

  // @IsOptional()
  // @IsDate()
  // updatedAt?: Date;

  // @IsString()
  // company_id?: string;

  // @IsString()
  // branch_id?: string;
}
