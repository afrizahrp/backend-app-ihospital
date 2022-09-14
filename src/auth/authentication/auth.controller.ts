import { Controller, Post, Body, Get, UseGuards, Req } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { sysUser, UserInfo } from '../../users/sysUser/sys-User.decorator';
// import { Roles } from './roles.decorator';

import { Request } from 'express';
import { AuthService } from './auth.service';
import { RegisterDto, LoginDto } from './dto/auth.dto';
import { Tokens } from './types';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/register')
  register(@Body() body: RegisterDto): Promise<Tokens> {
    try {
      return this.authService.register(body);
    } catch (error) {
      console.log(error.message);
    }
  }

  @Post('/login')
  async login(@Body() body: LoginDto): Promise<Tokens> {
    return this.authService.login(body);
  }

  @UseGuards(AuthGuard('jwt-access'))
  @Post('/logout')
  async logout(@Req() req: Request) {
    const user = req.user;
    return this.authService.logout(user['sub']);
  }

  @UseGuards(AuthGuard('jwt-refresh'))
  @Post('refresh')
  async refreshingToken(@Req() req: Request) {
    const user = req.user;
    return this.authService.refreshingToken(user['sub'], user['refreshToken']);
  }
  // // @UseGuards(AuthLocalGuard)
  // @Post('/login')
  // login(@Request() req): any {
  //   return this.authService.login(req.user);
  // }

  // @UseGuards(AuthLocalGuard)
  // @UseGuards(AuthJwtGuard)
  // @Post('/login')
  // login(@Body() body: LoginDto) {
  //   return this.authService.login(body);
  // }

  // // @UseGuards(LocalAuthGuard)
  // // @Post('login')
  // // login(@Request() req): any {
  // //   return this.authService.login(req.user);
  // // }

  // @UseGuards(AuthJwtGuard)
  // @Get('/protected')
  // getHello(@Request() req): string {
  //   return req.user;
  // }
  // // @UseGuards(AuthJwtGuard)
  // @Get('/me')
  // me(@sysUser() sysUser: UserInfo) {
  //   return sysUser;
  // }

  // eslint-disable-next-line prettier/prettier
}
