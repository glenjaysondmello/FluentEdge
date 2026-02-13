import { Test, TestingModule } from '@nestjs/testing';
import { TypingTestService } from './typing_test.service';
import { PrismaService } from '../prisma/prisma.service';
import { ConfigService } from '@nestjs/config';

describe('TypingTestService', () => {
  let service: TypingTestService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        TypingTestService,
        { provide: PrismaService, useValue: {} },
        {
          provide: ConfigService,
          useValue: { get: jest.fn().mockReturnValue('fake-api-key') },
        },
      ],
    }).compile();

    service = module.get<TypingTestService>(TypingTestService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
