import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
// import { UsersModule } from './users/users.module';
// import { AuthModule } from './auth/auth.module';

import { AuthController } from './auth/authentication/auth.controller';
import { AuthModule } from './auth/authentication/auth.module';
import { SysUserController } from './users/sysUser/sys-user.controller';
import { SysUserModule } from './users/sysUser/sys-user.module';
ConfigModule.forRoot();
@Module({
  imports: [AuthModule, SysUserModule],
  controllers: [AuthController, SysUserController],
  providers: [AppService],
})
export class AppModule {}
