import { Test, TestingModule } from '@nestjs/testing';
import { SpeakingTestResolver } from './speaking_test.resolver';
import { SpeakingTestService } from './speaking_test.service';

describe('SpeakingTestResolver', () => {
  let resolver: SpeakingTestResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        SpeakingTestResolver,
        {
          provide: SpeakingTestService,
          useValue: { findAll: jest.fn(), create: jest.fn() },
        },
      ],
    }).compile();

    resolver = module.get<SpeakingTestResolver>(SpeakingTestResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
