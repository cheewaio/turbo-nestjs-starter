import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { LoggerModule } from 'nestjs-pino';
import { Pino } from '@repo/common';

@Module({
  imports: [
    LoggerModule.forRoot({
      pinoHttp: {
        ...Pino.defaultOptions(),
      },
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
