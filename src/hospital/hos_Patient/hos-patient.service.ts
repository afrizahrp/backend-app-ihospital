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
}

interface UpdatePatientParams {
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

  async newPatient(
    {
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
    }: NewPatientParams,
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
        createdAt: new Date(),
        updatedAt: new Date(),
        createdBy: userId,
        updatedBy: userId,
        company_id: companyId,
        branch_id: branchId,
      },
    });
    return new ShowPatientDto(newPatient);
  }

  async update_Patient_ById(
    id: string,
    {
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
    }: UpdatePatientParams,
    userId: string,
    companyId: string,
    branchId: string,
  ) {
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
        data: {
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
      return new ShowPatientDto(updatedPatient);
    } catch (error) {
      throw new BadRequestException('Update Patient Failed');
    }
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

  // Delete patient
  async delete_Patient_ById(patientId: string) {
    const patientWillDelete = await this.prismaService.hosPatient.findUnique({
      where: {
        id: patientId,
      },
    });

    if (!patientWillDelete) {
      throw new NotFoundException('Patient not found');
    }

    try {
      const patientDeleted = await this.prismaService.hosPatient.delete({
        where: {
          id: patientId,
        },
      });
      return patientDeleted;
    } catch (error) {
      throw new BadRequestException('Delete Patient Failed');
    }
  }
}
