import { ObjectType, Field, Float, Int } from '@nestjs/graphql';

@ObjectType()
export class MoodAnalyticsOutput {
  @Field(() => Float)
  averageMoodScore: number;

  @Field(() => Int)
  moodCount: number;

  @Field(() => Int)
  positiveDays: number;

  @Field(() => Int)
  negativeDays: number;

  @Field(() => [String])
  mostUsedWords: string[];

  @Field(() => Int)
  streak: number;
}