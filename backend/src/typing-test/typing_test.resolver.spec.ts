import { Test, TestingModule } from '@nestjs/testing';
import { TypingTestResolver } from './typing_test.resolver';
import { TypingTestService } from './typing_test.service';

describe('TypingTestResolver', () => {
  let resolver: TypingTestResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        TypingTestResolver,
        {
          provide: TypingTestService,
          useValue: { findAll: jest.fn(), create: jest.fn() },
        },
      ],
    }).compile();

    resolver = module.get<TypingTestResolver>(TypingTestResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
