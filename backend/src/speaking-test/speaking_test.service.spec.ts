import { Test, TestingModule } from '@nestjs/testing';
import { SpeakingTestService } from './speaking_test.service';
import { PrismaService } from '../prisma/prisma.service';
import { ConfigService } from '@nestjs/config';

describe('SpeakingTestService', () => {
  let service: SpeakingTestService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        SpeakingTestService,
        { provide: PrismaService, useValue: {} },
        {
          provide: ConfigService,
          useValue: { get: jest.fn().mockReturnValue('fake-api-key') },
        },
      ],
    }).compile();

    service = module.get<SpeakingTestService>(SpeakingTestService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
