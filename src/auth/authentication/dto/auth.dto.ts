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
  isBoolean,
} from 'class-validator';
import { Exclude } from 'class-transformer';
import { ToBoolean } from 'src/toBoolean';

export class NewDataDto {
  @IsString()
  @IsNotEmpty()
  role_id: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(20)
  id: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(50)
  @IsEmail()
  email: string;

  // @IsString()
  // @IsNotEmpty()
  // @MinLength(5)
  // @MaxLength(20)
  // @Matches(
  //   /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
  //   {
  //     message: 'Invalid phone number format',
  //   },
  // )
  // phone: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(20)
  password: string;

  // @IsString()
  // @IsNotEmpty()
  // tokenForAccess: string;

  // @IsString()
  // refreshToken: string;
  @ToBoolean()
  @IsNotEmpty()
  isLoggedIn: boolean;

  @IsString()
  @IsNotEmpty()
  createdBy: string;

  @IsDate()
  @IsNotEmpty()
  createdAt: Date;

  @IsString()
  @IsNotEmpty()
  updatedBy: string;

  @IsDate()
  @IsNotEmpty()
  updatedAt: Date;

  @IsString()
  @IsNotEmpty()
  company_id: string;

  @IsString()
  @IsNotEmpty()
  branch_id: string;

  // @Exclude()
}

export class LoginDto {
  @IsEmail()
  email: string;

  @IsString()
  @IsNotEmpty()
  password: string;
}

export class LogOutDto {
  @IsString()
  @IsNotEmpty()
  id: string;
}
