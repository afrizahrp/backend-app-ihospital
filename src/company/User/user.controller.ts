import {
  Body,
  Controller,
  Get,
  Post,
  Delete,
  Param,
  UseGuards,
} from '@nestjs/common';
import { NewDataDto, ShowDataDto } from './user.dto';
import { UserService } from './user.service';
import { ActiveUser, ActiveUserInfo, Public } from 'src/auth/decorators';
import { AuthGuard } from '@nestjs/passport';
import { sysUser } from 'src/users/sysUser/sys-User.decorator';
import { UserInfo } from '../../users/sysUser/sys-User.decorator';
import { PrismaService } from 'src/prisma/prisma.service';

@Controller('users/')
export class UserController {
  constructor(
    private readonly userService: UserService,
    private readonly prismaService: PrismaService,
  ) {}

  @Public()
  @Get()
  gettingAll(): Promise<ShowDataDto[]> {
    return this.userService.getAllData();
  }

  // @Roles(Role.Admin)
  // @UseGuards(AuthGuard('jwt-access'))
  @Public()
  @Post('new')
  inserting(@Body() body: NewDataDto, @sysUser() sysUser: UserInfo) {
    try {
      return this.userService.newDataFields(body);
      //   ,
      //   sysUser.sub,
      //   sysUser.company_id,
      //   sysUser.branch_id,
      // );
    } catch (error) {
      console.log(error.message);
    }
  }

  // @Public()
  // @Delete(':id')
  // deleting(@Param('id') id: string) {
  //   return this.userService.deleteData(id);
  // }
}
