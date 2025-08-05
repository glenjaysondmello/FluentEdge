import { InputType, Field } from "@nestjs/graphql";

@InputType()
export class VerifyDownloadInput {
  @Field()
  fileId: string;

  @Field({ nullable: true })
  password?: string;
}