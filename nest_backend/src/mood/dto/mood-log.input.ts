import { InputType, Field } from '@nestjs/graphql';
import { MoodType } from '../types/mood.enum';

@InputType()
export class MoodLogInput {
  @Field()
  date: string;

  @Field(() => MoodType)
  mood: MoodType;

  @Field()
  journalText: string;
}
