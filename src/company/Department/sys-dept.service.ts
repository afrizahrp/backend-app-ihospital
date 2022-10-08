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

@Injectable()
export class SysDeptService {
  constructor(private readonly prismaService: PrismaService) {}

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

  // async getDataById(patient_id: string) {
  //   const foundId = await this.prismaService.hosPatient.findUnique({
  //     where: {
  //       id: patient_id,
  //     },
  //   });
  //   return foundId;
  // }

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
