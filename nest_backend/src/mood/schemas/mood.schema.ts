import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';
import { MoodType } from '../types/mood.enum';
import { Field, ObjectType, ID, Float } from '@nestjs/graphql';

@Schema({ timestamps: true })
@ObjectType()
export class MoodEntry {
  @Field(() => ID)
  _id: string;

  @Prop({ required: true })
  @Field()
  userId: string;

  @Prop({ required: true })
  @Field()
  date: string;

  @Prop({ type: String, enum: MoodType, required: true })
  @Field()
  mood: MoodType;

  @Prop({ type: String, required: true })
  @Field()
  journalText: string;

  @Prop({ type: Number, default: 0 })
  @Field(() => Float, { nullable: true })
  sentimentScore: number;
}

export type MoodEntryDocument = MoodEntry & Document;
export const MoodEntrySchema = SchemaFactory.createForClass(MoodEntry);
