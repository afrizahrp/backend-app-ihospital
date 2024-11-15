/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-inferrable-types */
/* eslint-disable @typescript-eslint/no-unused-vars */
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';
// import { Get_DocumentId_Service } from './../../sys-utils/get-document-id/get_DocumentId.service';

import { DocumentId } from '../../classes/DocumentId';
import { ShowDataDto } from './hos-admission.dto';
// import { hosAdmissionService } from './hos-registration.service';

interface NewDataParams {
  trxType: string;
  isEmergency?: boolean;
  emergency_id?: string;
  isAppointment?: boolean;
  appointment_id?: string;
  isInsurance?: boolean;
  insurance_id?: string;
  admissionDate: Date;
  patient_id: string;
  patientName: string;
  patientCase: string;
  isRefer: boolean;
  ref_id?: string;
  payType: number;
  pay_id?: string;
  status: number;
}

interface UpdateDataParams {
  trxType: string;
  isEmergency?: boolean;
  emergency_id?: string;
  isAppointment?: boolean;
  appointment_id?: string;
  isInsurance?: boolean;
  insurance_id?: string;
  admissionDate?: Date;
  patient_id: string;
  patientName?: string;
  patientCase?: string;
  isRefer?: boolean;
  ref_id?: string;

  payType?: number;
  pay_id?: string;
  status?: number;
}

@Injectable()
export class HosAdmissionService {
  constructor(private readonly prismaService: PrismaService) {}

  async newDataFields(
    {
      trxType,
      isEmergency,
      emergency_id,
      isAppointment,
      appointment_id,
      isInsurance,
      insurance_id,
      admissionDate,
      patient_id,
      patientName,
      patientCase,
      isRefer,
      ref_id,
      payType,
      pay_id,
      status,
    }: NewDataParams,
    userId: string,
    companyId: string,
    branchId: string,
  ) {
    // const emailExists = await this.prismaService.hosPatient.findUnique({
    //   where: { email: email },
    // });

    // if (emailExists) {
    //   throw new BadRequestException('Email is already exists');
    // }

    const documentId = new DocumentId(companyId, branchId, new Date(), userId);
    const docId = await documentId.gen_docId('HOS', 'AMS', '');

    const createNewData = await this.prismaService.hosAdmission.create({
      data: {
        id: docId,
        trxType,
        isEmergency,
        emergency_id,
        isAppointment,
        appointment_id,
        isInsurance,
        insurance_id,
        admissionDate,
        patient_id,
        patientName,
        patientCase,
        isRefer,
        ref_id,
        payType,
        pay_id,
        status,
        createdAt: new Date(),
        updatedAt: new Date(),
        createdBy: userId,
        updatedBy: userId,
        company_id: companyId,
        branch_id: branchId,
      },
    });
    return new ShowDataDto(createNewData);
  }

  async updateDataFields(
    doc_id: string,
    {
      trxType,
      isEmergency,
      emergency_id,
      isAppointment,
      appointment_id,
      isInsurance,
      insurance_id,
      admissionDate,
      patient_id,
      patientName,
      patientCase,
      isRefer,
      ref_id,

      payType,
      pay_id,
      status,
    }: UpdateDataParams,
    userId: string,
    companyId: string,
    branchId: string,
  ) {
    const foundId = await this.prismaService.hosAdmission.findUnique({
      where: {
        id: doc_id,
      },
    });

    if (!foundId) {
      throw new NotFoundException('Registration id is not found');
    }

    try {
      const updatedData = await this.prismaService.hosAdmission.update({
        where: {
          id: doc_id,
        },
        data: {
          trxType,
          isEmergency,
          emergency_id,
          isAppointment,
          appointment_id,
          isInsurance,
          insurance_id,
          admissionDate,
          patient_id,
          patientName,
          patientCase,
          isRefer,
          ref_id,
          payType,
          pay_id,
          status,
          updatedAt: new Date(),
          updatedBy: userId,
          company_id: companyId,
          branch_id: branchId,
        },
      });
      return new ShowDataDto(updatedData);
    } catch (error) {
      throw new BadRequestException('Updating registration failed');
    }
  }

  async getAllData(): Promise<ShowDataDto[]> {
    try {
      const allData = await this.prismaService.hosAdmission.findMany();
      return allData.map((Data) => new ShowDataDto(Data));
    } catch (error) {
      console.log(error.message);
      throw new BadRequestException('Getting all registration failed');
    }
    return [];
  }

  async getDataById(doc_id: string) {
    const foundId = await this.prismaService.hosAdmission.findUnique({
      where: {
        id: doc_id,
      },
    });
    return foundId;
  }

  // Delete patient
  async deleteData(doc_id: string) {
    const foundId = await this.prismaService.hosAdmission.findUnique({
      where: {
        id: doc_id,
      },
    });

    if (!foundId) {
      throw new NotFoundException('Registration id is not found');
      try {
        const datatDeleted = await this.prismaService.hosAdmission.delete({
          where: {
            id: doc_id,
          },
        });
        return datatDeleted;
      } catch (error) {
        throw new BadRequestException('Delete Patient Failed');
      }
    }
  }
}
