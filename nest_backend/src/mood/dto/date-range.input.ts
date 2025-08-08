import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class DateRangeInput {
    @Field(() => String)
    startDate: string;

    @Field(() => String)
    endDate: string;
}