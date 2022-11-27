/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-inferrable-types */
/* eslint-disable @typescript-eslint/no-unused-vars */
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';
import { DocumentId } from '../../classes/DocumentId';
import { ShowDataDto } from './sys-dept.dto';
import { NONAME } from 'dns';

interface NewDataParams {
  // Divs_id: string;
  // id: string;
  name: string;
}

@Injectable()
export class SysDeptService {
  constructor(private readonly prismaService: PrismaService) {}

  async newDataFields(
    { name }: NewDataParams, // , // userId: string, // companyId: string, // branchId: string,
  ) {
    // const idExists = await this.prismaService.sysDept.findUnique({
    //   where: { name: NONAME },
    // });

    // if (idExists) {
    //   throw new BadRequestException('Id is already exists');
    // }

    const documentId = new DocumentId(
      'NMS',
      'KLM1-JKT05',
      new Date(),
      'afriza',
    );
    const doc_id = await documentId.gen_docId('HOS', 'DEP', '');

    const newData = await this.prismaService.sysDept.create({
      data: {
        // Divs_id,
        id: doc_id,
        name,
        // createdAt: new Date(),
        // updatedAt: new Date(),
        // createdBy: userId,
        // updatedBy: userId,
        // company_id: companyId,
        // branch_id: branchId,
      },
    });
    return new ShowDataDto(newData);
  }

  async getAllData(): Promise<ShowDataDto[]> {
    try {
      const allData = await this.prismaService.sysDept.findMany();
      return allData.map((data) => new ShowDataDto(data));
    } catch (error) {
      console.log(error.message);
    }
    return [];
  }

  async getDataById(dept_id: string) {
    const foundId = await this.prismaService.sysDept.findUnique({
      where: {
        id: dept_id,
      },
    });
    return foundId;
  }

  async deleteData(_id: string) {
    const foundId = await this.prismaService.sysDept.findUnique({
      where: {
        id: _id,
      },
    });

    if (!foundId) {
      throw new NotFoundException('Patient not found');
    }

    try {
      const dataDeleted = await this.prismaService.sysDept.delete({
        where: {
          id: _id,
        },
      });
      this.getAllData();
      return dataDeleted;
    } catch (error) {
      throw new BadRequestException('Delete Patient Failed');
    }
  }
}
