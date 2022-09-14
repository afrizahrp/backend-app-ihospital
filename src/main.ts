import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import * as cookieParser from 'cookie-parser';
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      transform: true,
      transformOptions: { enableImplicitConversion: true },
    }),
  );
  app.use(cookieParser());
  // const reflector = new Reflector();

  // app.useGlobalGuards(new AccessTokenGuard(reflector)),
  app.enableCors({
    origin: ['http://localhost:3000', 'https://www.google.com'],
    methods: ['POST', 'PUT', 'DELETE', 'GET'],
  });

  await app.listen(7000);
}
bootstrap();
