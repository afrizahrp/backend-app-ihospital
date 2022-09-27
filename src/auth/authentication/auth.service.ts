import { ForbiddenException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import { PrismaService } from './../../prisma/prisma.service';
import { JwtPayload, Tokens } from './types';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';
interface RegisterParams {
  role_id: string;
  id: string;
  name: string;
  email: string;
  phone: string;
  password: string;
  tokenForAccess: string;
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
    // const [accessToken] = await Promise.all([
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
        tokenHasRefreshed: hash,
        isLoggedIn: true,
      },
    });
  }

  async register({
    role_id,
    id,
    name,
    email,
    phone,
    password,
    tokenForAccess,
    isLoggedIn,
    createdBy,
    createdAt,
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
          id,
          name,
          email,
          phone,
          password: hash,
          tokenForAccess: hash,
          isLoggedIn: false,
          tokenHasRefreshed: '',
          createdBy,
          createdAt,
          updatedBy,
          updatedAt: new Date(),
          company_id,
          branch_id,
        },
      });
      const tokens = await this.getTokens(
        newUser.id,
        newUser.role_id,
        newUser.name,
        newUser.email,
        newUser.company_id,
        newUser.branch_id,
      );
      await this.updateTokenRefreshed(newUser.id, newUser.tokenHasRefreshed);
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
        tokenHasRefreshed: {
          not: null,
        },
      },
      data: {
        tokenHasRefreshed: null,
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
    if (!userHasLoggedIn || !userHasLoggedIn.tokenHasRefreshed) {
      throw new ForbiddenException('Access is denied, you not logged in');
    }

    const rTokenMatched = await bcrypt.compare(
      tokenWillRefresh,
      userHasLoggedIn.tokenHasRefreshed,
    );

    if (!rTokenMatched) {
      throw new ForbiddenException('Token does not valid');
    }
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
