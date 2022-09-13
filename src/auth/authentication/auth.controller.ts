/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unused-vars */
import {
  Controller,
  Post,
  Body,
  Get,
  UseGuards,
  Request,
} from '@nestjs/common';
import { sysUser, UserInfo } from '../../users/sysUser/sys-User.decorator';
// import { Roles } from './roles.decorator';
import { AuthService } from './auth.service';
import { Register_Dto, Login_Dto } from './auth.dto';
//import { AuthGuard } from '../authentication/auth.guard';
// import { throwError } from 'rxjs';
// import { Roles } from 'src/authorization/roles.decorator';
// import { UserType } from '@prisma/client';
// import { sysUserRole } from '@prisma/client';
// import { AuthGuard } from '@nestjs/passport';

import { AuthLocalGuard } from './auth.local.guard';
import { AuthJwtGuard } from './auth.jwt.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  // @Get()
  // get_Users() {
  //   try {
  //     return this.authService.get_Users();
  //   } catch (error) {
  //     console.dir(error.message);
  //   }
  // }

  @Post('/register')
  register(@Body() body: Register_Dto) {
    try {
      // return this.authService.get_Token(body);
      return this.authService.register(body);
    } catch (error) {
      console.log(error.message);
    }
  }

  // @Roles(sys_User_Role.ADMIN)
  // @UseGuards(AuthGuard('local'))
  // @Post('/login')
  // @UseGuards(AuthLocalGuard)
  // async login(@Body() body: Login_Dto) {
  //   return this.authService.get_Token(body);
  // }

  // // @UseGuards(AuthLocalGuard)
  // @Post('/login')
  // login(@Request() req): any {
  //   return this.authService.login(req.user);
  // }

  // @UseGuards(AuthLocalGuard)
  // @UseGuards(AuthJwtGuard)
  @Post('/login')
  login(@Body() body: Login_Dto) {
    return this.authService.login(body);
  }

  // @UseGuards(LocalAuthGuard)
  // @Post('login')
  // login(@Request() req): any {
  //   return this.authService.login(req.user);
  // }

  @UseGuards(AuthJwtGuard)
  @Get('/protected')
  getHello(@Request() req): string {
    return req.user;
  }
  // @UseGuards(AuthJwtGuard)
  @Get('/me')
  me(@sysUser() sysUser: UserInfo) {
    return sysUser;
  }

  // eslint-disable-next-line prettier/prettier
}
