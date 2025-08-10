import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql';
import { MoodService } from './mood.service';
import { MoodEntry } from './schemas/mood.schema';
import { MoodLogInput } from './dto/mood-log.input';
import { DateRangeInput } from './dto/date-range.input';
import { MoodAnalyticsOutput } from './dto/mood-analytics.output';
import { UseGuards } from '@nestjs/common';
import { FirebaseAuthGuard } from 'src/auth/firebase-auth.guard';

interface GqlContext {
  req: { user: { uid: string } };
}

@Resolver(() => MoodEntry)
@UseGuards(FirebaseAuthGuard)
export class MoodResolver {
  constructor(private readonly moodService: MoodService) {}

  @Mutation(() => MoodEntry)
  async logMood(
    @Args('input') input: MoodLogInput,
    @Context() context: GqlContext,
  ) {
    const userId = context.req.user.uid;
    return this.moodService.create(input, userId);
  }

  @Mutation(() => MoodEntry)
  async updateMood(
    @Args('id') id: string,
    @Args('input') input: MoodLogInput,
    @Context() context: GqlContext,
  ) {
    const userId = context.req.user.uid;
    return this.moodService.update(id, input, userId);
  }

  @Mutation(() => Boolean)
  async deleteMood(@Args('id') id: string, @Context() context: GqlContext) {
    const userId = context.req.user.uid;
    return this.moodService.delete(id, userId);
  }

  @Query(() => MoodEntry, { nullable: true })
  async getTodayMood(@Context() context: GqlContext) {
    const userId = context.req.user.uid;
    return this.moodService.getToday(userId);
  }

  @Query(() => [MoodEntry])
  async getMoodHistory(
    @Args('range') range: DateRangeInput,
    @Context() context: GqlContext,
  ) {
    const userId = context.req.user.uid;
    return this.moodService.getRange(userId, range);
  }

  @Query(() => MoodAnalyticsOutput)
  async getMoodStats(@Context() context: GqlContext) {
    const userId = context.req.user.uid;
    return this.moodService.getStats(userId);
  }
}
