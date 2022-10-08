/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */

import { Exclude } from 'class-transformer';

export class ShowDataDto {
  dept_id: string;

  id: string;

  name: string;

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
