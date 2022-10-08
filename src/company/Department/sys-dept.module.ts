import { Module } from '@nestjs/common';
import { APP_GUARD } from '@nestjs/core';
import { AccessTokenGuard } from 'src/auth/authentication/guards';
import { PrismaModule } from './../../prisma/prisma.module';
import { SysDeptController } from './sys-dept.controller';
import { SysDeptService } from './sys-dept.service';

@Module({
  imports: [PrismaModule],
  controllers: [SysDeptController],
  providers: [
    SysDeptService,
    {
      provide: APP_GUARD,

      useClass: AccessTokenGuard,
    },
  ],
})
export class SysDeptModule {}
