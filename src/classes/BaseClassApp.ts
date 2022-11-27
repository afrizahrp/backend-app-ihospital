/* eslint-disable prettier/prettier */
export class BaseClassApp {
  constructor(
    public companyId: string,
    public branchId: string,
    public _docDate: Date,
    public userId: string,
  ) {}

  getCompanyId() {
    return this.companyId;
  }

  getBranchId() {
    return this.companyId;
  }
}
