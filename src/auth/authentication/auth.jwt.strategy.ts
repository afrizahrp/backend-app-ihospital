import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';

@Injectable()
export class AuthJwtStrategy extends PassportStrategy(Strategy) {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.AUTH_SECRET,
    }); // Protect this, move to env var
  }

  async validate(payload: any) {
    //const user = await this.prisma_Service.getById(payload.sub);

    return {
      id: payload.sub,
      name: payload.name,
      //...user,
    };
  }
}
