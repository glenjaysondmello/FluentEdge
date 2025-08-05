import { Module } from '@nestjs/common';
import { MoodService } from './mood.service';
import { MoodResolver } from './mood.resolver';
import { MongooseModule } from '@nestjs/mongoose';
import { MoodEntry, MoodEntrySchema } from './schemas/mood.schema';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: MoodEntry.name, schema: MoodEntrySchema },
    ]),
  ],
  providers: [MoodService, MoodResolver],
})
export class MoodModule {}
