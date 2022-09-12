import { Controller, Get, Post, Request, UseGuards } from '@nestjs/common';
// import { AppService } from './app.service';
// // import { AuthenticatedGuard } from './auth/authenticated.guard';
// import { AuthService } from './auth/authentication/auth.service';
// import { LocalAuthGuard } from './auth/authentication/local-auth.guard';
// import { JwtAuthGuard } from './auth/authentication/jwt.auth.guard';

@Controller()
export class AppController {}
//   constructor(private readonly authService: AuthService) {}

//   // @UseGuards(LocalAuthGuard)
//   @UseGuards(LocalAuthGuard)
//   @Post('login')
//   login(@Request() req): any {
//     return this.authService.login(req.user);
//   }

//   // @UseGuards(AuthenticatedGuard)
//   @UseGuards(JwtAuthGuard)
//   @Get('protected')
//   getHello(@Request() req): string {
//     return req.user;
//   }
// }
