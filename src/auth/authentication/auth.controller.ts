import { Controller, Post, Body, Get, UseGuards } from '@nestjs/common';
import { ActiveUserId } from '../decorators/activeUserId.decorator';

import { ActiveUser, ActiveUserInfo } from '../decorators/activeUser.decorator';

// import { Request, response } from 'express';
import { AuthService } from './auth.service';
import { NewDataDto, LoginDto } from './dto/auth.dto';
import { Tokens } from './types';
import { AccessTokenGuard } from './guards/accessToken.guard';
import { RefreshTokenGuard } from './guards/refreshToken.guard';
import { Public } from '../decorators/public.decorator';
// import { sysUser } from 'src/users/sysUser/sys-User.decorator';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Public()
  @Post('register')
  register(@Body() body: NewDataDto): Promise<Tokens> {
    try {
      return this.authService.register(body);
    } catch (error) {
      console.log(error.message);
    }
  }

  @Public()
  @Post('login')
  async login(@Body() body: LoginDto): Promise<Tokens> {
    return this.authService.login(body);
  }

  @Public()
  @Get('me')
  me(@ActiveUser() user: ActiveUserInfo) {
    return user;
  }

  @UseGuards(AccessTokenGuard)
  @Post('logout')
  async logout(@ActiveUserId() id: string): Promise<boolean> {
    return this.authService.logout(id);
  }

  // @Public()
  // @UseGuards(RefreshTokenGuard)
  // @Post('/refresh')
  // async refreshingToken(
  //   @ActiveUserId() userId: string,
  //   @ActiveUser('refreshToken') refreshToken: string,
  // ): Promise<Tokens> {
  //   return this.authService.refreshingToken(userId, refreshToken);
  // }
}
