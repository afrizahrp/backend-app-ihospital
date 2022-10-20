/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */

import { Exclude } from 'class-transformer';
import { IsNotEmpty, IsString } from 'class-validator';

export class NewDataDto {
  // @IsString()
  // @IsNotEmpty()
  // Divs_id: string;

  // @IsString()
  // @IsNotEmpty()
  // id: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  // createdBy: string;

  // createdAt: Date;

  // @IsString()
  // updatedBy: string;

  // @Exclude()
  // updatedAt: Date;

  // @Exclude()
  // company_id: string;

  // @Exclude()
  // branch_id: string;
}

export class ShowDataDto {
  // divs_id: string;

  id: string;

  name: string;

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
