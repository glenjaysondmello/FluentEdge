import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
// const graphqlUploadExpress = require('graphql-upload/public/graphqlUploadExpress.js');
const graphqlUploadExpress =
  require('graphql-upload/graphqlUploadExpress.mjs').default;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.use(graphqlUploadExpress({ maxFileSize: 10000000, maxFiles: 1 }));
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
