/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-inferrable-types */
/* eslint-disable @typescript-eslint/no-unused-vars */
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';
import { ShowDataDto } from './user.dto';

interface NewDataParams {
  id: number;
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
}

@Injectable()
export class UserService {
  constructor(private readonly prismaService: PrismaService) {}

  async newDataFields(
    {
      id,
      fullName,
      company,
      role,
      username,
      country,
      contact,
      email,
      currentPlan,
      status,
      avatar,
    }: NewDataParams, // , // userId: string, // companyId: string, // branchId: string,
  ) {
    const newData = await this.prismaService.users.create({
      data: {
        id,
        fullName,
        company,
        role,
        username,
        country,
        contact,
        email,
        currentPlan,
        status,
        avatar,
        createdBy: 'afriza',
        createdAt: new Date(),
        updatedBy: 'afriza',
        updatedAt: new Date(),
      },
    });
    return new ShowDataDto(newData);
  }

  async getAllData(): Promise<ShowDataDto[]> {
    try {
      const allData = await this.prismaService.users.findMany();
      return allData.map((data) => new ShowDataDto(data));
    } catch (error) {
      console.log(error.message);
    }
    return [];
  }

  // async getDataById(dept_id: string) {
  //   const foundId = await this.prismaService.sysDept.findUnique({
  //     where: {
  //       id: dept_id,
  //     },
  //   });
  //   return foundId;
  // }

  // async deleteData(_id: string) {
  //   const foundId = await this.prismaService.sysDept.findUnique({
  //     where: {
  //       id: _id,
  //     },
  //   });

  //   if (!foundId) {
  //     throw new NotFoundException('Patient not found');
  //   }

  //   try {
  //     const dataDeleted = await this.prismaService.sysDept.delete({
  //       where: {
  //         id: _id,
  //       },
  //     });
  //     this.getAllData();
  //     return dataDeleted;
  //   } catch (error) {
  //     throw new BadRequestException('Delete Patient Failed');
  //   }
  // }
}
