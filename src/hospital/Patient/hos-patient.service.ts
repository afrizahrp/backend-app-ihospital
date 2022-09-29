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
import { ShowDataDto } from './hos-patient.dto';

interface NewDataParams {
  isReferred: boolean;
  referredFrom: string;
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
}

interface UpdateDataParams {
  isReferred?: boolean;
  referredFrom?: string;
  nickName?: string;
  fullName?: string;
  birthDate?: Date;
  ageInYear?: number;
  ageInMonth?: number;
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

  async newDataFields(
    {
      isReferred,
      referredFrom,
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
    }: NewDataParams,
    userId: string,
    companyId: string,
    branchId: string,
  ) {
    const emailExists = await this.prismaService.hosPatient.findUnique({
      where: { email: email },
    });

    if (emailExists) {
      throw new BadRequestException('Email is already exists');
    }

    const documentId = new DocumentId(companyId, branchId, userId);
    const doc_id = await documentId.gen_docId('HOS', 'PTN', '');

    const newData = await this.prismaService.hosPatient.create({
      data: {
        id: doc_id,
        isReferred,
        referredFrom,
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
        createdAt: new Date(),
        updatedAt: new Date(),
        createdBy: userId,
        updatedBy: userId,
        company_id: companyId,
        branch_id: branchId,
      },
    });
    return new ShowDataDto(newData);
  }

  async updateDataFields(
    patient_id: string,
    {
      isReferred,
      referredFrom,
      nickName,
      fullName,
      birthDate,
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
    }: UpdateDataParams,
    userId: string,
    companyId: string,
    branchId: string,
  ) {
    const foundId = await this.prismaService.hosPatient.findUnique({
      where: {
        id: patient_id,
      },
    });

    if (!foundId) {
      throw new NotFoundException('Patient not found');
    }

    try {
      const updatedData = await this.prismaService.hosPatient.update({
        where: {
          id: patient_id,
        },
        data: {
          isReferred,
          referredFrom,
          nickName,
          fullName,
          birthDate,
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
          updatedAt: new Date(),
          updatedBy: userId,
          company_id: companyId,
          branch_id: branchId,
        },
      });
      return new ShowDataDto(updatedData);
    } catch (error) {
      throw new BadRequestException('Updating patient failed');
    }
  }

  async getAllData(): Promise<ShowDataDto[]> {
    try {
      const allData = await this.prismaService.hosPatient.findMany();
      return allData.map((data) => new ShowDataDto(data));
    } catch (error) {
      console.log(error.message);
    }
    return [];
  }

  async getDataById(patient_id: string) {
    const foundId = await this.prismaService.hosPatient.findUnique({
      where: {
        id: patient_id,
      },
    });
    return foundId;
  }

  // Delete patient
  async deleteData(patient_id: string) {
    const foundId = await this.prismaService.hosPatient.findUnique({
      where: {
        id: patient_id,
      },
    });

    if (!foundId) {
      throw new NotFoundException('Patient not found');
    }

    try {
      const patientDeleted = await this.prismaService.hosPatient.delete({
        where: {
          id: patient_id,
        },
      });
      return patientDeleted;
    } catch (error) {
      throw new BadRequestException('Delete Patient Failed');
    }
  }
}
