/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable prettier/prettier */

import { Exclude } from 'class-transformer';

export class ShowDataDto {
  role_id: string;

  id: string;

  name: string;

  email: string;

  phone: string;

  @Exclude()
  password: string;

  @Exclude()
  tokenForAccess: string;

  @Exclude()
  isLoggedIn: boolean;

  @Exclude()
  tokenHasRefreshed: string;

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
