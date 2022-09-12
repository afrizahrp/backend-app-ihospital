import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { SysUserModule } from 'src/users/sysUser/sys-user.module';
// import { UsersModule } from './../users/users.module';
// import { UsersModule } from 'src/users/sysUser/users.module';
import { AuthService } from './auth.service';
import { AuthJwtStrategy } from './auth.jwt.strategy';
import { AuthLocalStrategy } from './auth.local.strategy';
import { PrismaService } from 'src/prisma/prisma.service';
// import { ConfigModule } from '@nestjs/config';
// ConfigModule.forRoot();

@Module({
  imports: [
    SysUserModule,
    PassportModule,
    JwtModule.registerAsync({
      useFactory: () => ({
        secret: process.env.AUTH_SECRET,
        signOptions: { expiresIn: '60m' },
      }),
    }),
  ],
  providers: [PrismaService, AuthService, AuthLocalStrategy, AuthJwtStrategy],
  exports: [AuthService],
})
export class AuthModule {}

// imports: [UsersModule, PassportModule.register({ session: true })],
// import { AuthJwtStrategy } from './auth.jwt.strategy';
// providers: [AuthService, LocalStrategy, SessionSerializer],
