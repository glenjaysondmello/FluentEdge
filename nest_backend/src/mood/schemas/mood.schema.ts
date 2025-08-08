import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';
import { MoodType } from '../types/mood.enum';

@Schema({ timestamps: true })
export class MoodEntry {
  @Prop({ required: true })
  userId: string;

  @Prop({ required: true })
  date: string;

  @Prop({ type: String, enum: MoodType, required: true })
  mood: MoodType;

  @Prop({ type: String, required: true })
  journalText: string;

  @Prop({ type: Number, default: 0 })
  sentimentScore: number;
}

export type MoodEntryDocument = MoodEntry & Document;
export const MoodEntrySchema = SchemaFactory.createForClass(MoodEntry);