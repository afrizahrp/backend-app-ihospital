import { ForbiddenException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import { PrismaService } from './../../prisma/prisma.service';
import { JwtPayload, Tokens } from './types';
interface RegisterParams {
  role_id: string;
  isAdmin: boolean;
  id: string;
  name: string;
  email: string;
  phone: string;
  password: string;
  accessToken: string;
  refreshToken: string;
  loggedIn: boolean;
  createdBy: string;
  updatedBy: string;
  updatedAt: Date;
  company_id: string;
  branch_id: string;
}

interface LoginParams {
  email: string;
  password: string;
}
@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private readonly prismaService: PrismaService,
    private config: ConfigService,
  ) {}

  async getTokens(id: string, email: string): Promise<Tokens> {
    const jwtPayload: JwtPayload = {
      sub: id,
      email: email,
    };
    const [accessToken, refreshToken] = await Promise.all([
      this.jwtService.signAsync(
        { sub: id, email },
        {
          secret: this.config.get<string>('ACCESS_TOKEN_SECRET'),
          expiresIn: '15m',
        },
      ),

      this.jwtService.signAsync(
        { sub: id, email },
        {
          secret: 'SECRET', //this.config.get<string>('REFRESH_TOKEN_SECRET'),
          expiresIn: '5d',
        },
      ),
    ]);
    return { accessToken, refreshToken };
  }

  private hashData(data: string) {
    return bcrypt.hash(data, 10);
  }

  async updateRefreshTokenHash(id: string, refreshToken: string) {
    const hash = await this.hashData(refreshToken);
    await this.prismaService.sysUser.update({
      where: {
        id,
      },
      data: {
        refreshToken: hash,
        loggedIn: true,
      },
    });
  }

  async register({
    role_id,
    isAdmin,
    id,
    name,
    email,
    phone,
    password,
    accessToken,
    refreshToken,
    loggedIn,
    createdBy,
    updatedBy,
    updatedAt,
    company_id,
    branch_id,
  }: RegisterParams): Promise<Tokens> {
    const email_Exists = await this.prismaService.sysUser.findUnique({
      where: { email },
    });

    const hash = await this.hashData(password);

    if (email_Exists) {
      throw new Error('Email is already exists');
    }
    try {
      const newUser = await this.prismaService.sysUser.create({
        data: {
          role_id,
          isAdmin,
          id,
          name,
          email,
          phone,
          password: hash,
          accessToken: hash,
          refreshToken: hash,
          loggedIn: false,
          createdBy,
          updatedBy,
          updatedAt: new Date(),
          company_id,
          branch_id,
        },
      });
      const tokens = await this.getTokens(newUser.id, newUser.email);
      await this.updateRefreshTokenHash(newUser.id, newUser.refreshToken);
      return tokens;
    } catch (error) {
      console.log(error.message);
    }
  }

  async login({ email, password }: LoginParams): Promise<Tokens> {
    const sysUser = await this.prismaService.sysUser.findUnique({
      where: { email },
    });

    if (!sysUser) {
      throw new ForbiddenException('Access denied, you cannot login');
    }

    const is_Password_Matched = await bcrypt.compare(
      password,
      sysUser.password,
    );

    if (!is_Password_Matched) {
      throw new ForbiddenException('Password does not valid');
    }
    const tokens = await this.getTokens(sysUser.id, sysUser.email);
    await this.updateRefreshTokenHash(sysUser.id, sysUser.refreshToken);
    return tokens;

    // return sysUser;

    // return this.generateJWT(sysUser.id, sysUser.email);
  }

  async logout(id: string) {
    await this.prismaService.sysUser.updateMany({
      where: {
        id,
        refreshToken: {
          not: null,
        },
      },
      data: {
        refreshToken: '',
        loggedIn: false,
      },
    });
  }

  async refresh(email: string, refreshToken: string) {
    const userLoggedIn = await this.prismaService.sysUser.findUnique({
      where: { email },
    });
    if (!userLoggedIn) {
      throw new ForbiddenException('Access denied, you cannot login');
    }

    const rTokenMatched = await bcrypt.compare(
      refreshToken,
      userLoggedIn.refreshToken,
    );

    if (!rTokenMatched) {
      throw new ForbiddenException('Password does not valid');
    }
    const tokens = await this.getTokens(userLoggedIn.id, userLoggedIn.email);
    await this.updateRefreshTokenHash(
      userLoggedIn.id,
      userLoggedIn.refreshToken,
    );
    return tokens;
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
}
