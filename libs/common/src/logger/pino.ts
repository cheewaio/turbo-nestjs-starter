import * as pino from 'pino';

export class Pino {
  static defaultOptions() {
    return {
      formatters: {
        level: (label: string) => {
          return { level: label };
        },
      },
      timestamp: pino.stdTimeFunctions.isoTime,
      transport: process.env.NODE_ENV !== 'production' && {
        target: 'pino-pretty',
        options: {
          colorize: true,
          singleLine: true,
        },
      },
    };
  }
}
