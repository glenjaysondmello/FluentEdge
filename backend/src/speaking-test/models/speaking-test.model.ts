import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
export class SpeakingScore {
  @Field() fluency: number;
  @Field() pronunciation: number;
  @Field() grammar: number;
  @Field() vocabulary: number;
  @Field() overall: number;
}

@ObjectType()
export class SpeakingMistake {
  @Field() error: string;
  @Field() correction: string;
  @Field() type: string;
}

@ObjectType()
export class SpeakingTest {
  @Field(() => ID) id: string;
  @Field() uid: string;
  @Field() referenceText: string;
  @Field() transcript: string;
  @Field(() => SpeakingScore) scores: SpeakingScore;
  @Field(() => [SpeakingMistake]) mistakes: SpeakingMistake[];
  @Field(() => [String]) suggestions: string[];
  @Field() encouragement: string;
  @Field() createdAt: Date;
}
