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
} from 'class-validator';
import { Exclude } from 'class-transformer';

export class NewPatientDto {
  @IsString()
  @IsNotEmpty()
  id: string;

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

  @IsNumber()
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
      message: 'Invalid phone number format',
    },
  )
  mobileNo1: string;

  @IsString()
  @MinLength(5)
  @MaxLength(20)
  @Matches(
    /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
    {
      message: 'Invalid phone number format',
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

  @IsString()
  createdBy: string;

  @IsString()
  updatedBy: string;

  // @IsDate()
  // @IsNotEmpty()
  // updatedAt: Date;

  @IsString()
  company_id: string;

  @IsString()
  branch_id: string;
}
