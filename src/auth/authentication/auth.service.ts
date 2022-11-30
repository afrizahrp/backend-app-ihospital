import { ForbiddenException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import { PrismaService } from './../../prisma/prisma.service';
import { JwtPayload, Tokens } from './types';
interface RegisterParams {
  role_id: string;
  id: string;
  name: string;
  password: string;
  email: string;
  isLoggedIn: boolean;
  createdBy: string;
  createdAt: Date;
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

  async getTokens(
    id: string,
    username: string,
    role: string,
    email: string,
    company_id: string,
    branch_id: string,
  ): Promise<Tokens> {
    const jwtPayload: JwtPayload = {
      sub: id,
      username,
      role,
      email,
      company_id,
      branch_id,
    };

    const [accessToken, refreshToken] = await Promise.all([
      this.jwtService.signAsync(jwtPayload, {
        secret: this.config.get<string>('ACCESS_TOKEN_SECRET'),
        expiresIn: '1d',
      }),

      this.jwtService.signAsync(jwtPayload, {
        secret: this.config.get<string>('REFRESH_TOKEN_SECRET'),
        expiresIn: '5d',
      }),
    ]);
    // return { accessToken };
    return { accessToken, refreshToken };
  }

  private hashData(data: string) {
    return bcrypt.hash(data, 10);
  }

  async updateTokenRefreshed(id: string, tokenToRefresh: string) {
    const hash = await this.hashData(tokenToRefresh);
    await this.prismaService.sysUser.update({
      where: {
        id,
      },
      data: {
        isLoggedIn: true,
      },
    });
  }

  async register({
    role_id,
    id,
    name,
    email,
    password,
    isLoggedIn,
    createdBy,
    createdAt,
    updatedBy,
    updatedAt,
    company_id,
    branch_id,
  }: RegisterParams): Promise<Tokens> {
    const idExists = await this.prismaService.sysUser.findUnique({
      where: { email },
    });

    const hash = await this.hashData(password);

    if (idExists) {
      throw new Error('Email is already exists');
    }
    try {
      const insertRow = await this.prismaService.sysUser.create({
        data: {
          role_id,
          id,
          name,
          email,
          password: hash,
          isLoggedIn: false,
          createdBy,
          createdAt,
          updatedBy,
          updatedAt: new Date(),
          company_id,
          branch_id,
        },
      });
      const tokens = await this.getTokens(
        insertRow.id,
        insertRow.role_id,
        insertRow.name,
        insertRow.email,
        insertRow.company_id,
        insertRow.branch_id,
      );
      // await this.updateTokenRefreshed(insertRow.id);
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
      throw new ForbiddenException('Access is denied, you cannot login');
    }

    const is_Password_Matched = await bcrypt.compare(
      password,
      sysUser.password,
    );

    if (!is_Password_Matched) {
      throw new ForbiddenException('Password does not valid');
    }

    const userData = {
      id: sysUser.id,
      username: sysUser.name,
      role: sysUser.role_id,
      email: sysUser.email,
      company_id: sysUser.company_id,
      branch_id: sysUser.branch_id,
    };

    const tokens = await this.getTokens(
      sysUser.id.trim(),
      sysUser.name.trim(),
      sysUser.role_id.toLowerCase().trim(),
      sysUser.email,
      sysUser.company_id,
      sysUser.branch_id,
    );
    await this.updateTokenRefreshed(sysUser.id, tokens.refreshToken);
    return tokens;
  }

  async logout(id: string): Promise<boolean> {
    await this.prismaService.sysUser.updateMany({
      where: {
        id,
        isLoggedIn: true,
      },
      data: {
        isLoggedIn: false,
      },
    });
    return true;
  }

  async refreshingToken(
    userId: string,
    tokenWillRefresh: string,
  ): Promise<Tokens> {
    const userHasLoggedIn = await this.prismaService.sysUser.findUnique({
      where: { id: userId },
    });
    if (!userHasLoggedIn) {
      throw new ForbiddenException('Access is denied, you not logged in');
    }

    // const rTokenMatched = await bcrypt.compare(
    //   tokenWillRefresh,
    //   userHasLoggedIn.tokenHasRefreshed,
    // );

    // if (!rTokenMatched) {
    //   throw new ForbiddenException('Token does not valid');
    // }
    const tokens = await this.getTokens(
      userHasLoggedIn.id,
      userHasLoggedIn.name.trim(),
      userHasLoggedIn.email,
      userHasLoggedIn.role_id.toLowerCase().trim(),
      userHasLoggedIn.company_id.toLowerCase().trim(),
      userHasLoggedIn.branch_id.toLocaleUpperCase().trim(),
    );
    await this.updateTokenRefreshed(userHasLoggedIn.id, tokens.refreshToken);

    return tokens;
  }
}
