import {
  Controller,
  Post,
  Body,
  Get,
  UseGuards,
  Req,
  Res,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ActiveUserId } from '../decorators/activeUserId.decorator';

import { ActiveUser, UserInfo } from '../decorators/activeUser.decorator';

import { Request, response } from 'express';
import { AuthService } from './auth.service';
import { RegisterDto, LoginDto } from './dto/auth.dto';
import { Tokens } from './types';
import { AccessTokenGuard } from './guards/accessToken.guard';
import { RefreshTokenGuard } from './guards/refreshToken.guard';
import { Public } from '../decorators/public.decorator';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Public()
  @Post('register')
  register(@Body() body: RegisterDto): Promise<Tokens> {
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
    // const jwt = await this.authService.getTokens;
    // response.cookie('jwt', jwt, { httpOnly: true });
  }

  // @Public()
  // @Post('login')
  // async login(@Body() body: LoginDto): Promise<Tokens> {
  //   return this.authService.login(body);
  // }

  // @UseGuards(AuthGuard('jwt-access'))
  // @Public()
  // @Get('me')
  // me(@ActiveUser() sysUser: UserInfo) {
  //   return sysUser;
  // }
  // @UseGuards(AccessTokenGuard)
  @Public()
  @Get('/me')
  me(@sysUser() sysUser: UserInfo) {
    return sysUser;
  }

  @UseGuards(AccessTokenGuard)
  @Post('logout')
  async logout(@ActiveUserId() id: string): Promise<boolean> {
    return this.authService.logout(id);
  }

  @Public()
  @UseGuards(RefreshTokenGuard)
  @Post('/refresh')
  async refreshingToken(
    @ActiveUserId() id: string,
    @ActiveUser('refreshToken') refreshToken: string,
  ): Promise<Tokens> {
    return this.authService.refreshingToken(id, refreshToken);
  }
}
