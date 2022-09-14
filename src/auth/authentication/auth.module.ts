/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { ConfigService } from '@nestjs/config';
import { SysUserModule } from 'src/users/sysUser/sys-user.module';
import { AuthService } from './auth.service';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthController } from './auth.controller';
import { AccessTokenStrategy } from './strategies/accessToken.strategy';
import { RefreshTokenStrategy } from './strategies/refreshToken.strategy';
@Module({
  imports: [
    SysUserModule,
    PassportModule,
    JwtModule.registerAsync({
      useFactory: () => ({
        secret: process.env.AUTH_SECRET,
        signOptions: { expiresIn: '15m' },
      }),
    }),
  ],
  controllers: [AuthController],
  providers: [
    PrismaService,
    AccessTokenStrategy,
    RefreshTokenStrategy,
    AuthService,
    ConfigService,
  ],
  exports: [AuthService],
})
export class AuthModule {}
