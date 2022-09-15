import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { BaseClassApp } from './BaseClassApp';

@Injectable()
export class DocumentId extends BaseClassApp {
  constructor(companyId: string, branchId: string, userId: string) {
    super(companyId, branchId, userId);
  }

  async gen_docId(
    moduleId: string,
    prefixId: string,
    _docId: string,
  ): // rt_company_Id: string,
  // rt_branch_Id: string,

  Promise<string> {
    const prisma_Service = new PrismaService();
    const result =
      await prisma_Service.$queryRaw`EXEC get_document_id ${this.companyId},${this.branchId},${moduleId},${prefixId},${this.userId},${_docId};`;

    if (Array.isArray(result)) {
      if (typeof result === 'object') {
        const row = result[0];
        if (typeof row === 'object') {
          const data = {
            doc_id: row['doc_id'],
          };
          const doc_id = data.doc_id;
          return doc_id;
        }
      }
    }
  }
}
