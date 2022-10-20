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
    { name }: NewDataParams,
    userId: string,
    companyId: string,
    branchId: string, // , // userId: string, // companyId: string, // branchId: string,
  ) {
    // const idExists = await this.prismaService.sysDept.findUnique({
    //   where: { name: NONAME },
    // });

    // if (idExists) {
    //   throw new BadRequestException('Id is already exists');
    // }

    const documentId = new DocumentId(companyId, branchId, userId);
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
}
