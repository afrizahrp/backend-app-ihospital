import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import { userInfo } from 'os';
import { SysUserService } from 'src/users/sysUser/sys-user.service';
// import { UsersService } from 'src/users/users.service';
import { PrismaService } from './../../prisma/prisma.service';
interface Register_Params {
  role_id: string;
  isAdmin: boolean;
  id: string;
  name: string;
  email: string;
  phone: string;
  password: string;
  createdBy: string;
  updatedBy: string;
  updatedAt: Date;
  company_id: string;
  branch_id: string;
}
interface Login_Params {
  email: string;
  password: string;
}
@Injectable()
export class AuthService {
  constructor(
    //private usersService: UsersService,
    private jwtService: JwtService,
    private usersService: SysUserService,
    private readonly prismaService: PrismaService,
  ) {}

  async register({
    role_id,
    isAdmin,
    id,
    name,
    email,
    phone,
    password,
    createdBy,
    updatedBy,
    updatedAt,
    company_id,
    branch_id,
  }: Register_Params) {
    const email_Exists = await this.prismaService.sysUser.findUnique({
      where: { email },
    });

    if (email_Exists) {
      throw new Error('Email is already exists');
    }
    try {
      const hashed_Password = await bcrypt.hash(password, 10);

      const sysUser = await this.prismaService.sysUser.create({
        data: {
          role_id,
          isAdmin,
          id,
          name,
          email,
          phone,
          password: hashed_Password,
          createdBy,
          updatedBy,
          updatedAt: new Date(),
          company_id,
          branch_id,
        },
      });

      return this.generateJWT(sysUser.id, sysUser.email);
    } catch (error) {
      console.log(error.message);
    }
  }

  async login({ email, password }: Login_Params) {
    const sysUser = await this.prismaService.sysUser.findUnique({
      where: { email: email },
    });

    if (!sysUser) {
      throw new Error('Unable to login');
    }

    const is_Password_Matched = await bcrypt.compare(
      password,
      sysUser.password,
    );

    if (!is_Password_Matched) {
      throw new Error('Password does not valid');
    }

    return this.generateJWT(sysUser.id, sysUser.email);
  }

  // async generateJWT(id: string, name: string) {
  //   const payload = { id, name };
  //   return {
  //     access_token: this.jwtService.sign(payload),
  //   };
  // }

  private generateJWT(id: string, email: string) {
    const jwtPayload = { sub: id, email };

    return this.jwtService.signAsync(jwtPayload, {
      secret: process.env.AUTH_SECRET,
      expiresIn: '3600s',
    });
  }

  async validateUser(email: string, password: string): Promise<any> {
    const user = await this.prismaService.sysUser.findUnique({
      where: { email },
    });

    if (user && password === user.password) {
      const { email, password, ...rest } = user;
      return rest;
    }
    return null;
  }

  // async validateUser(username: string, password: string): Promise<any> {
  //   const user = await this.usersService.findOne(username);
  //   if (user && user.password === password) {
  //     const { password, username, ...rest } = user;
  //     return rest;
  //   }
  //   return null;
  // }
  // async login(user: any) {
  //   const payload = { name: user.name, sub: user.id };
  //   return {
  //     access_token: this.jwtService.sign(payload),
  //   };
  // }
}
