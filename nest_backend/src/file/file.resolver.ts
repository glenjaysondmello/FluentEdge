import { Resolver, Mutation, Args, Context, Field } from '@nestjs/graphql';
import { UseGuards } from '@nestjs/common';
import { FileService } from './file.service';
import { CreateFileInput } from './dto/create-file.input';
import { FirebaseAuthGuard } from '../auth/firebase-auth.guard';
import GraphQlUpload from 'graphql-upload';
import { FileUpload } from './dto/create-file.input';
import { FileModel } from './models/file.model';

@Resolver(() => FileModel)
export class FileResolver {
  constructor(private readonly fileService: FileService) {}

  @UseGuards(FirebaseAuthGuard)
  @Mutation(() => FileModel)
  async uploadFile(
    @Args('input') input: CreateFileInput,
    @Args({ name: 'file', type: () => GraphQlUpload })
    file: Promise<FileUpload>,
    @Context('req') req: any,
  ): Promise<FileModel> {
    const ownerId = req.user?.uid;
    return this.fileService.createFile({ ...input, file }, ownerId);
  }

  @Mutation(() => String)
  async verifyAndDownload(
    @Args('fileId') fieldId: string,
    @Args('password', { nullable: true }) password?: string,
  ): Promise<string> {
    return this.fileService.verifyAndDownload(fieldId, password);
  }
}
