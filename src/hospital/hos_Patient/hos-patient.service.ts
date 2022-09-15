/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-inferrable-types */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { Injectable } from '@nestjs/common';

import { PrismaService } from '../../prisma/prisma.service';
// import { Get_DocumentId_Service } from './../../sys-utils/get-document-id/get_DocumentId.service';

import { AppService } from '../../app.service';

import { DocumentId } from '../../classes/DocumentId';

interface Register_Params {
  id: string;
  name: string;
}

@Injectable()
export class HosPatientService {
  constructor(private readonly prismaService: PrismaService) {}

  async get_All() {
    try {
      const patients = await this.prismaService.tmpPatient.findMany();
      return patients;
    } catch (error) {
      console.log(error.message);
    }
  }

  // async get_Document_Id() {
  //   const docId = this.documentId.gen_docId('HOS', 'REG', '');
  // }

  async register({ id, name }: Register_Params) {
    const documentId = new DocumentId('NMS', 'KLM1-JKT05', 'afriza');
    const docId = await documentId.gen_docId('HOS', 'REG', '');

    const newPatient = await this.prismaService.tmpPatient.create({
      data: {
        id: docId,
        name,
      },
    });
    return newPatient;
  }
}
