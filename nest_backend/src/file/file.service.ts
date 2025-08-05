import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { File, FileDocument } from './file.schema';
import { CreateFileInput } from './dto/create-file.input';
import * as bcrypt from 'bcrypt';
import { CloudinaryService } from '../cloudinary/cloudinary.service';
import { FileModel } from './models/file.model';

@Injectable()
export class FileService {
  constructor(
    @InjectModel(File.name) private fileModel: Model<FileDocument>,
    private readonly cloudinaryService: CloudinaryService,
  ) {}

  async createFile(
    input: CreateFileInput,
    ownerId: string,
  ): Promise<FileModel> {
    const passwordHash = input.password
      ? await bcrypt.hash(input.password, 10)
      : undefined;

    const file = await input.file;
    const uploadResult = await this.cloudinaryService.uploadFile(file);

    const newFile = new this.fileModel({
      filename: input.filename,
      downloadUrl: uploadResult,
      passwordHash,
      expiresAt: input.expiresAt,
      remainingDownloads: input.remainingDownloads,
      ownerId,
    });

    const savedFile = (await newFile.save()) as FileDocument;

    return {
      id: (savedFile._id as import('mongoose').Types.ObjectId).toString(),
      filename: savedFile.filename,
      downloadUrl: savedFile.downloadUrl,
      passwordHash: savedFile.passwordHash,
      expiresAt: savedFile.expiresAt,
      remainingDownloads: savedFile.remainingDownloads,
      ownerId: savedFile.ownerId,
    };
  }

  async verifyAndDownload(fileId: string, password?: string): Promise<string> {
    const file = await this.fileModel.findById(fileId);

    if (!file) throw new Error('File not found');
    if (new Date() > file.expiresAt) throw new Error('File link expired');
    if ((file.remainingDownloads ?? 0) <= 0)
      throw new Error('Download limit exceeded');

    if (file.passwordHash && password) {
      const valid = await bcrypt.compare(password, file.passwordHash);
      if (!valid) throw new Error('Invalid password');
    }

    if (file.remainingDownloads ?? 0 > 0) {
      file.remainingDownloads = (file.remainingDownloads ?? 0) - 1;
    }

    await file.save();

    return file.downloadUrl;
  }
}
