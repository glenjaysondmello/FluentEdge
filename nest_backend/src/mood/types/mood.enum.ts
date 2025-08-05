import { registerEnumType } from '@nestjs/graphql';

export enum MoodType {
  HAPPY = 'HAPPY',
  SAD = 'SAD',
  NEUTRAL = 'NEUTRAL',
  ANGRY = 'ANGRY',
  EXCITED = 'EXCITED',
  TIRED = 'TIRED',
  STRESSED = 'STRESSED',
}

registerEnumType(MoodType, {
  name: 'MoodType',
});
