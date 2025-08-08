import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { MoodEntry, MoodEntryDocument } from './schemas/mood.schema';
import { Model } from 'mongoose';
import { MoodLogInput } from './dto/mood-log.input';
import { DateRangeInput } from './dto/date-range.input';
import { MoodAnalyticsOutput } from './dto/mood-analytics.output';

@Injectable()
export class MoodService {
  constructor(
    @InjectModel(MoodEntry.name) private moodModel: Model<MoodEntryDocument>,
  ) {}

  async create(input: MoodLogInput, userId: string) {
    const entry = new this.moodModel({ ...input, userId });
    return await entry.save();
  }

  async update(id: string, input: MoodLogInput, userId: string) {
    const updatedEntry = await this.moodModel.findOneAndUpdate(
      { _id: id, userId },
      input,
      {
        new: true,
      },
    );
    return updatedEntry;
  }

  async delete(id: string, userId: string) {
    const deletedEntry = await this.moodModel.deleteOne({ _id: id, userId });
    return deletedEntry.deletedCount > 0;
  }

  async getToday(userId: string) {
    const today = new Date().toISOString().slice(0, 10);
    const res = await this.moodModel.findOne({ userId, date: today });
    return res;
  }

  async getRange(userId: string, range: DateRangeInput) {
    const res = await this.moodModel
      .find({
        userId,
        date: {
          $gte: range.startDate,
          $lte: range.endDate,
        },
      })
      .sort({ date: 1 });

    return res;
  }

  async getStats(userId: string): Promise<MoodAnalyticsOutput> {
    const moods = await this.moodModel.find({ userId });

    const averageMoodScore =
      moods.reduce((sum, m) => sum + (m.sentimentScore || 0), 0) /
      (moods.length || 1);

    const mostUsedWords = this.extractTopWords(
      moods.map((m) => m.journalText).join(' '),
    );

    return {
      averageMoodScore,
      moodCount: moods.length,
      positiveDays: moods.filter((m) => (m.sentimentScore || 0) > 0.5).length,
      negativeDays: moods.filter((m) => (m.sentimentScore || 0) < -0.5).length,
      mostUsedWords,
      streak: this.calculateStreak(moods),
    };
  }

  private extractTopWords(text: string): string[] {
    const words = text.toLowerCase().match(/\b[a-z]{4,}\b/g) || [];
    const freq: Record<string, number> = {};

    words.forEach((w) => (freq[w] = (freq[w] || 0) + 1));

    const topWords = Object.entries(freq)
      .sort((a, b) => b[1] - a[1])
      .slice(0, 10)
      .map(([word]) => word);

    return topWords;
  }

  private calculateStreak(moods: MoodEntry[]): number {
    const dates = new Set(moods.map((m) => m.date));
    let streak = 0;

    for (let i = 0; ; i++) {
      const d = new Date();
      d.setDate(d.getDate() - i);

      const iso = d.toISOString().slice(0, 10);
      if (dates.has(iso)) streak++;
      else break;
    }

    return streak;
  }
}
