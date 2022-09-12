import { Injectable } from '@nestjs/common';

export type User = {
  id: number;
  name: string;
  username: string;
  password: string;
};

@Injectable()
export class UsersService {
  private readonly users: User[] = [
    {
      id: 1,
      name: 'Peter Parker',
      username: 'peter',
      password: 'secure',
    },
    {
      id: 2,
      name: 'Marry Jane',
      username: 'Marry',
      password: '1234567',
    },
  ];
  async findOne(username: string): Promise<User | undefined> {
    return this.users.find((user) => user.username === username);
  }
}
