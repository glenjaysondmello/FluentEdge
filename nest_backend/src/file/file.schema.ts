import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

@Schema()
export class File {
  @Prop({ required: true })
  filename: string;

  @Prop({ required: true })
  downloadUrl: string;

  @Prop()
  passwordHash?: string;

  @Prop({ required: true })
  expiresAt: Date;

  @Prop()
  remainingDownloads?: number;

  @Prop({ required: true })
  ownerId: string;
}

export type FileDocument = File & Document;

export const FileSchema = SchemaFactory.createForClass(File);
