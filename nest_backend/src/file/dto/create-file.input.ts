import { InputType, Field } from '@nestjs/graphql';
import GraphqlUpload from 'graphql-upload';

export interface FileUpload {
  filename: string;
  mimetype: string;
  encoding: string;
  createReadStream: () => NodeJS.ReadableStream;
  buffer: Buffer;
}

@InputType()
export class CreateFileInput {
  @Field(() => GraphqlUpload)
  file: Promise<FileUpload>;

  @Field()
  filename: string;

  @Field()
  downloadUrl: string;

  @Field({ nullable: true })
  password?: string;

  @Field()
  expiresAt: Date;

  @Field({ nullable: true })
  remainingDownloads?: number;
}
