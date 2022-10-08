import { Module } from '@nestjs/common';
import { APP_GUARD } from '@nestjs/core';
import { AccessTokenGuard } from 'src/auth/authentication/guards';
import { PrismaModule } from '../../prisma/prisma.module';
import { SysSubDeptController } from './sys-subDept.controller';
import { SysSubDeptService } from './sys-subDept.service';

@Module({
  imports: [PrismaModule],
  controllers: [SysSubDeptController],
  providers: [
    SysSubDeptService,
    {
      provide: APP_GUARD,

      useClass: AccessTokenGuard,
    },
  ],
})
export class SysSubDeptModule {}
