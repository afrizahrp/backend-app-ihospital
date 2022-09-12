import { Module } from '@nestjs/common';
import { SysUserService } from './sys-user.service';

@Module({
  providers: [SysUserService],
  exports: [SysUserService],
})
export class SysUserModule {}
