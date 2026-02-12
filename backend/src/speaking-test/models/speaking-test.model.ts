import { ObjectType, Field, ID, registerEnumType } from '@nestjs/graphql';

@ObjectType()
export class SpeakingScore {
  @Field() fluency!: number;
  @Field() pronunciation!: number;
  @Field() grammar!: number;
  @Field() vocabulary!: number;
  @Field() overall!: number;
}

@ObjectType()
export class SpeakingMistake {
  @Field() error!: string;
  @Field() correction!: string;
  @Field() type!: string;
}

export enum SpeakingTestStatus {
  PROCESSING = 'PROCESSING',
  COMPLETED = 'COMPLETED',
  FAILED = 'FAILED',
}

registerEnumType(SpeakingTestStatus, {
  name: 'SpeakingTestStatus',
  description: 'The processing status of the speaking test',
});

@ObjectType()
export class SpeakingTest {
  @Field(() => ID) id!: string;
  @Field() uid!: string;
  @Field() referenceText!: string;
  @Field({ nullable: true }) transcript!: string;
  @Field(() => SpeakingScore, { nullable: true }) scores!: SpeakingScore;
  @Field(() => [SpeakingMistake], { nullable: true })
  mistakes!: SpeakingMistake[];
  @Field(() => [String], { nullable: true }) suggestions!: string[];
  @Field({ nullable: true }) encouragement!: string;
  @Field(() => SpeakingTestStatus) status!: SpeakingTestStatus;
  @Field() createdAt!: Date;
}
