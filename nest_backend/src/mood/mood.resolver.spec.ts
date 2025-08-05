import { Test, TestingModule } from '@nestjs/testing';
import { MoodResolver } from './mood.resolver';

describe('MoodResolver', () => {
  let resolver: MoodResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [MoodResolver],
    }).compile();

    resolver = module.get<MoodResolver>(MoodResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
