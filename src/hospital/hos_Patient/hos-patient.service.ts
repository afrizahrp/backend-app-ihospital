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
import { ShowPatientDto } from './hos-patient.dto';

interface NewPatientParams {
  nickName: string;
  fullName: string;
  birthDate: Date;
  ageInYear: number;
  ageInMonth: number;
  gender: string;
  religion: string;
  bloodType: string;
  maritalStatus: string;
  country_id: string;
  prov_id: string;
  provName: string;
  subProv_id: string;
  subProvName: string;
  district_id: string;
  districtName: string;
  subdistrict_id: string;
  subdistrictName: string;
  address: string;
  mobileNo1: string;
  mobileNo2: string;
  phoneNo: string;
  email: string;
  occupation: string;
  createdBy: string;
  updatedBy: string;
  company_id: string;
  branch_id: string;
}

interface UpdatePatientParams {
  nickName?: string;
  fullName?: string;
  birthDate?: Date;
  ageInYear?: number;
  ageInMonth: number;
  gender?: string;
  religion?: string;
  bloodType?: string;
  maritalStatus?: string;
  country_id?: string;
  prov_id?: string;
  provName?: string;
  subProv_id?: string;
  subProvName?: string;
  district_id?: string;
  districtName?: string;
  subdistrict_id?: string;
  subdistrictName?: string;
  address?: string;
  mobileNo1?: string;
  mobileNo2?: string;
  phoneNo?: string;
  email?: string;
  occupation?: string;
}

@Injectable()
export class HosPatientService {
  constructor(private readonly prismaService: PrismaService) {}

  async newPatient({
    nickName,
    fullName,
    birthDate,
    ageInYear,
    ageInMonth,
    gender,
    religion,
    bloodType,
    maritalStatus,
    country_id,
    prov_id,
    provName,
    subProv_id,
    subProvName,
    district_id,
    districtName,
    subdistrict_id,
    subdistrictName,
    address,
    mobileNo1,
    mobileNo2,
    phoneNo,
    email,
    occupation,
    createdBy,
    updatedBy,
    company_id,
    branch_id,
  }: NewPatientParams) {
    const emailExists = await this.prismaService.hosPatient.findUnique({
      where: { email },
    });

    if (emailExists) {
      throw new BadRequestException('Email is already exists');
    }

    const documentId = new DocumentId('NMS', 'KLM1-JKT05', 'afriza');
    const docId = await documentId.gen_docId('HOS', 'PNT', '');

    const newPatient = await this.prismaService.hosPatient.create({
      data: {
        id: docId,
        nickName,
        fullName,
        birthDate,
        ageInYear,
        ageInMonth,
        gender,
        religion,
        bloodType,
        maritalStatus,
        country_id,
        prov_id,
        provName,
        subProv_id,
        subProvName,
        district_id,
        districtName,
        subdistrict_id,
        subdistrictName,
        address,
        mobileNo1,
        mobileNo2,
        phoneNo,
        email,
        occupation,
        createdBy,
        updatedBy,
        company_id,
        branch_id,
      },
    });
    //return newPatient;
    return new ShowPatientDto(newPatient);
  }

  async getPatients(): Promise<ShowPatientDto[]> {
    try {
      const patients = await this.prismaService.hosPatient.findMany();
      return patients.map((patient) => new ShowPatientDto(patient));
    } catch (error) {
      console.log(error.message);
    }
    return [];
  }

  async get_Patient_ById(id: string) {
    const patient = await this.prismaService.hosPatient.findUnique({
      where: {
        id: id,
      },
    });
    return patient;
  }

  async update_Patient_ById(id: string, data: UpdatePatientParams) {
    const patient = await this.prismaService.hosPatient.findUnique({
      where: {
        id: id,
      },
    });

    if (!patient) {
      throw new NotFoundException('Patient not found');
    }

    try {
      const updatedPatient = await this.prismaService.hosPatient.update({
        where: {
          id: id,
        },
        data: data,
      });
      // return updatedPatient;
      return new ShowPatientDto(updatedPatient);
    } catch (error) {
      throw new BadRequestException('Update Patient Failed');
    }
  }
}

// const updatedPatient = await this.prismaService.hosPatient.update({
//   where: {
//     id: id,
//   },
//   data,
// });
