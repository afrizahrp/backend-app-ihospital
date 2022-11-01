/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */

import { Exclude } from 'class-transformer';
import { IsNotEmpty, IsString } from 'class-validator';

export class NewDataDto {
  @IsString()
  id: string;

  @IsString()
  fullName: string;

  @IsString()
  company: string;

  @IsString()
  role: string;

  @IsString()
  username: string;

  @IsString()
  country: string;

  @IsString()
  contact: string;

  @IsString()
  email: string;

  @IsString()
  currentPlan: string;

  @IsString()
  status: string;

  @IsString()
  avatar: string;

  @Exclude()
  createdAt: Date;

  // @Exclude()
  // @IsString()
  // createdBy: string;
  // @Exclude()
  // @IsString()
  // updatedBy: string;

  @Exclude()
  updatedAt: Date;
}

export class ShowDataDto {
  // divs_id: string;

  id: string;

  fullName: string;

  company: string;
  role: string;
  username: string;
  country: string;
  contact: string;
  email: string;
  currentPlan: string;
  status: string;
  avatar: string;

  // @Exclude()
  // createdBy: string;

  // @Exclude()
  // createdAt: Date;

  // @Exclude()
  // updatedBy: string;

  // @Exclude()
  // updatedAt: Date;

  // @Exclude()
  // company_id: string;

  // @Exclude()
  // branch_id: string;

  constructor(partial: Partial<ShowDataDto>) {
    Object.assign(this, partial);
  }
}
