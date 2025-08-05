import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
export class FileModel {
  @Field(() => ID)
  id: string;

  @Field()
  filename: string;

  @Field()
  downloadUrl: string;

  @Field({ nullable: true })
  passwordHash?: string;

  @Field()
  expiresAt: Date;

  @Field({ nullable: true })
  remainingDownloads?: number;

  @Field()
  ownerId: string;
}
