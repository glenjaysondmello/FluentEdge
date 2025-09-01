import { Module } from '@nestjs/common';
import { SpeakingTestService } from './speaking_test.service';
import { SpeakingTestResolver } from './speaking_test.resolver';
import { CloudinaryModule } from 'src/cloudinary/cloudinary.module';

@Module({
  imports: [CloudinaryModule],
  providers: [SpeakingTestService, SpeakingTestResolver]
})
export class SpeakingTestModule {}
