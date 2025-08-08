import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql';
import { MoodService } from './mood.service';
import { MoodEntry } from './schemas/mood.schema';
import { MoodLogInput } from './dto/mood-log.input';
import { DateRangeInput } from './dto/date-range.input';
import { MoodAnalyticsOutput } from './dto/mood-analytics.output';
import { UseGuards } from '@nestjs/common';
import { FirebaseAuthGuard } from 'src/auth/firebase-auth.guard';

@Resolver(() => MoodEntry)
@UseGuards(FirebaseAuthGuard)
export class MoodResolver {
  constructor(private readonly moodService: MoodService) {}

  @Mutation(() => MoodEntry)
  async logMood(@Args('input') input: MoodLogInput, @Context() context) {
    const ownerId = context.req.user.uid;
    return this.moodService.create(input, ownerId);
  }

  @Mutation(() => MoodEntry)
  async updateMood(
    @Args('id') id: string,
    @Args('input') input: MoodLogInput,
    @Context() context,
  ) {
    const ownerId = context.req.user.uid;
    return this.moodService.update(id, input, ownerId);
  }

  @Mutation(() => Boolean)
  async deleteMood(@Args('id') id: string, @Context() context) {
    const ownerId = context.req.user.uid;
    return this.moodService.delete(id, ownerId);
  }

  @Query(() => MoodEntry, { nullable: true })
  async getTodayMood(@Context() context) {
    const ownerId = context.req.user.uid;
    return this.moodService.getToday(ownerId);
  }

  @Query(() => [MoodEntry])
  async getMoodHistory(
    @Args('range') range: DateRangeInput,
    @Context() context,
  ) {
    const ownerId = context.req.user.uid;
    return this.moodService.getRange(ownerId, range);
  }

  @Query(() => MoodAnalyticsOutput)
  async getMoodStats(@Context() context) {
    const ownerId = context.req.user.uid;
    return this.moodService.getStats(ownerId);
  }
}
