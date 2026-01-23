import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { evaluateWithGroq } from 'src/speaking-test/evaluation/ai-evaluatar-speaking';
import { transcribeAudio } from './evaluation/whisper';
import { FileUpload } from 'graphql-upload/processRequest.mjs';
import { ConfigService } from '@nestjs/config';
import Groq from 'groq-sdk';

@Injectable()
export class SpeakingTestService {
  private client: Groq;

  constructor(
    private readonly prismaService: PrismaService,
    private readonly configService: ConfigService,
  ) {
    this.client = new Groq({
      apiKey: this.configService.get<string>('GROQ_API_KEY'),
    });
  }

  async generateSpeakingText(): Promise<string> {
    try {
      const response = await this.client.chat.completions.create({
        model: 'openai/gpt-oss-20b',
        messages: [
          {
            role: 'system',
            content:
              "You are a curator of interesting and accessible scientific knowledge. Your task is to generate a unique, fascinating scientific fact, presented as a cohesive paragraph. The paragraph must be approximately 150 words, making it suitable for a 60-second speaking assessment for an English professional. Use clear, intermediate-level vocabulary and varied sentence structures, ensuring the topic is easily understandable without requiring specialized knowledge. Present only the fact itself as a complete paragraph with correct punctuation. Do not include any introductory phrases like 'Here is a fascinating fact' or conversational filler.",
          },
          {
            role: 'user',
            content: 'Generate a new paragraph for a speaking test.',
          },
        ],
      });

      let content: string | undefined | null =
        response.choices[0]?.message.content;

      if (typeof content === 'string') {
        content = content.trim();
      } else {
        content = '';
      }

      return content;
    } catch (error) {
      console.error('Error fetching text from Groq API:', error);
      return 'The quick brown fox jumps over the lazy dog. This is a fallback text because the generator service is currently unavailable.';
    }
  }

  async getSpeakingTests(uid: string) {
    return this.prismaService.speakingTest.findMany({
      where: { uid },
      orderBy: { createdAt: 'desc' },
    });
  }

  async getResultById(uid: string, resultId: string) {
    return this.prismaService.speakingTest.findFirst({
      where: { uid, id: resultId },
    });
  }

  async submitSpeakingTest(
    uid: string,
    referenceText: string,
    audioFile: FileUpload,
  ) {
    const initialRecord = await this.prismaService.speakingTest.create({
      data: {
        uid,
        referenceText,
        transcript: '',
        scores: {},
        mistakes: [],
        suggestions: [],
        encouragement: '',
        status: 'PROCESSING',
      },
    });

    const recordId: string = initialRecord.id;

    this.processAudioInBackground(
      uid,
      recordId,
      referenceText,
      audioFile,
    ).catch((err) => {
      console.error('Background processing failed', err);
    });

    return recordId;
  }

  private async processAudioInBackground(
    uid: string,
    recordId: string,
    referenceText: string,
    audioFile: FileUpload,
  ) {
    try {
      // const [transcript] = await Promise.all([transcribeAudio(audioFile)]);

      const transcript = await transcribeAudio(audioFile, this.client);
      const aiResult = await evaluateWithGroq(
        {
          referenceText,
          transcript,
        },
        this.client,
      );

      await this.prismaService.speakingTest.update({
        where: { uid, id: recordId },
        data: {
          uid,
          referenceText,
          transcript,
          scores: aiResult.scores,
          mistakes: aiResult.mistakes,
          suggestions: aiResult.suggestions,
          encouragement: aiResult.encouragement,
          status: 'COMPLETED',
        },
      });
    } catch (err) {
      await this.prismaService.speakingTest.update({
        where: { uid, id: recordId },
        data: {
          status: 'FAILED',
        },
      });
    }
  }
}
