import { Injectable } from '@nestjs/common';

export type sysUser = {
  id: number;
  username: string;
  name: string;
  email: string;
  password: string;
};

@Injectable()
export class SysUserService {
  private readonly sysUsers = [
    {
      id: 1,
      username: 'john',
      name: 'jhon travolta',
      email: 'john@email.com',
      password: 'rahasia',
    },
    {
      id: 2,
      username: 'peter',
      name: 'peter parker',
      email: 'peter@email.com',
      password: 'secure',
    },
  ];

  async findOne(username: string): Promise<sysUser | undefined> {
    return this.sysUsers.find((sysUser) => sysUser.username === username);
  }
}
