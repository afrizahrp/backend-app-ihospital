/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-inferrable-types */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { Injectable } from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';
// import { Get_DocumentId_Service } from './../../sys-utils/get-document-id/get_DocumentId.service';

import { DocumentId } from '../../classes/DocumentId';

interface NewPatientParams {
  id: string;
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
  subDistrict_id: string;
  subDistrictName: string;
  address: string;
  mobile1: string;
  mobile2: string;
  phone: string;
  email: string;
  occupation: string;
  createdBy: string;
  updatedBy: string;
  updatedAt: Date;
  company_id: string;
  branch_id: string;
}

@Injectable()
export class HosPatientService {
  constructor(private readonly prismaService: PrismaService) {}

  async get_All() {
    try {
      const patients = await this.prismaService.hosPatient.findMany();
      return patients;
    } catch (error) {
      console.log(error.message);
    }
  }

  // async get_Document_Id() {
  //   const docId = this.documentId.gen_docId('HOS', 'REG', '');
  // }

  async insertPatient({
    id,
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
    mobile1,
    mobile2,
    phone,
    email,
    occupation,
    createdBy,
    updatedBy,
    company_id,
    branch_id,
  }: NewPatientParams) {
    const documentId = new DocumentId('NMS', 'KLM1-JKT05', 'afriza');
    const docId = await documentId.gen_docId('HOS', 'REG', '');

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
        mobile1,
        mobile2,
        phone,
        email,
        occupation,
        createdBy,
        updatedBy,
        company_id,
        branch_id,
      },
    });
    return newPatient;
  }
}
