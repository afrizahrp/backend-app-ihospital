import { Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ExtractJwt } from 'passport-jwt';

@Injectable()
export class RefreshTokenGuard extends AuthGuard('jwt-refresh') {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: 'secret', //process.env.JSON_TOKEN_KEY,
    }); // Protect this, move to env var
  }

  async validate(payload: any) {
    //const user = await this.prisma_Service.getById(payload.sub);

    return {
      id: payload.sub,
      email: payload.name,
      //...user,
    };
  }
}
