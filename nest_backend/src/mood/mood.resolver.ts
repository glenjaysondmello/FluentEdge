import { Resolver, Query, Mutation, Args} from '@nestjs/graphql';
import { MoodService } from './mood.service';
import { MoodEntry } from './schemas/mood.schema';
import { MoodLogInput } from './dto/mood-log.input';
import { DateRangeInput } from './dto/date-range.input';
import { MoodAnalyticsOutput } from './dto/mood-analytics.output';

@Resolver(() => MoodEntry)
export class MoodResolver {
  constructor(private readonly moodService: MoodService) {}

  @Mutation(() => MoodEntry)
  async logMood(
    @Args('input') input: MoodLogInput,
    @Args('userId') userId: string,
  ) {
    return this.moodService.create(input, userId);
  }

  @Mutation(() => MoodEntry)
  async updateMood(
    @Args('id') id: string,
    @Args('input') input: MoodLogInput,
    @Args('userId') userId: string,
  ) {
    return this.moodService.update(id, input, userId);
  }

  @Mutation(() => Boolean)
  async deleteMood(@Args('id') id: string, @Args('userId') userId: string) {
    return this.moodService.delete(id, userId);
  }

  @Query(() => MoodEntry, { nullable: true })
  async getTodayMood(@Args('userId') userId: string) {
    return this.moodService.getToday(userId);
  }

  @Query(() => [MoodEntry])
  async getMoodHistory(
    @Args('range') range: DateRangeInput,
    @Args('userId') userId: string,
  ) {
    return this.moodService.getRange(userId, range);
  }

  @Query(() => MoodAnalyticsOutput)
  async getMoodStats(@Args('userId') userId: string) {
    return this.moodService.getStats(userId);
  }
}
