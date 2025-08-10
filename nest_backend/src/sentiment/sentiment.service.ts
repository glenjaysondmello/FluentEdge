import { Injectable } from '@nestjs/common';
import Groq from 'groq-sdk';

@Injectable()
export class SentimentService {
  private client: Groq;

  constructor() {
    this.client = new Groq({
      apiKey: process.env.GROQ_API_KEY,
    });
  }

  async analyzeMoodScore(journalText: string): Promise<number> {
    const prompt = `
      On a scale of -1 (very negative) to +1 (very positive), rate the sentiment of the following journal entry. Return only the number.

      Journal Entry:
      """${journalText}"""
    `;

    const response = await this.client.chat.completions.create({
      model: 'llama3-8b-8192',
      messages: [{ role: 'user', content: prompt }],
    });

    let content: string | undefined | null =
      response.choices[0]?.message.content;

    if (typeof content === 'string') {
      content = content.trim();
    } else {
      content = '';
    }

    // const rawContent = response.choices[0]?.message?.content ?? '';
    // const content = rawContent.trim();

    const score = parseFloat(content);

    return isNaN(score) ? 0 : score;
  }
}
