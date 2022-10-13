/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-inferrable-types */
/* eslint-disable @typescript-eslint/no-unused-vars */
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';
import { ShowDataDto } from './sys-dept.dto';

interface NewDataParams {
  // Divs_id: string;
  id: string;
  name: string;
}

@Injectable()
export class SysDeptService {
  constructor(private readonly prismaService: PrismaService) {}

  async newDataFields({ id, name }: NewDataParams) // ,
  // userId: string,
  // companyId: string,
  // branchId: string,
  {
    const idExists = await this.prismaService.sysDept.findUnique({
      where: { id: id },
    });

    if (idExists) {
      throw new BadRequestException('Id is already exists');
    }

    // const documentId = new DocumentId(companyId, branchId, userId);
    // const doc_id = await documentId.gen_docId('HOS', 'PTN', '');

    const newData = await this.prismaService.sysDept.create({
      data: {
        // Divs_id,
        id,
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

  // export class ReportService {
  //   getAllReports(type: ReportType): ReportResponseDto[] {
  //     return data.report
  //       .filter((report) => report.type === type)
  //       .map((report) => new ReportResponseDto(report));
  //   }

  async getDataById(dept_id: string) {
    const foundId = await this.prismaService.sysDept.findUnique({
      where: {
        id: dept_id,
      },
    });
    return foundId;
  }

  // Delete patient
  // async deleteData(patient_id: string) {
  //   const foundId = await this.prismaService.hosPatient.findUnique({
  //     where: {
  //       id: patient_id,
  //     },
  //   });

  //   if (!foundId) {
  //     throw new NotFoundException('Patient not found');
  //   }

  //   try {
  //     const patientDeleted = await this.prismaService.hosPatient.delete({
  //       where: {
  //         id: patient_id,
  //       },
  //     });
  //     return patientDeleted;
  //   } catch (error) {
  //     throw new BadRequestException('Delete Patient Failed');
  //   }
  // }
}
