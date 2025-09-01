import { Injectable, Inject } from '@nestjs/common';
import { UploadApiResponse, UploadApiErrorResponse } from 'cloudinary';
import { FileUpload } from 'graphql-upload/processRequest.mjs';

@Injectable()
export class CloudinaryService {
  constructor(@Inject('Cloudinary') private cloudinary: any) {}
  uploadAudio(
    file: FileUpload,
  ): Promise<UploadApiResponse | UploadApiErrorResponse> {
    const { createReadStream } = file;

    return new Promise((resolve, reject) => {
      const uploadStream = this.cloudinary.uploader.upload_stream(
        {
          resource_type: 'video', // Cloudinary treats audio as 'video' resource type
        },
        (error: any, result: any) => {
          if (error) {
            return reject(error);
          }
          resolve(result);
        },
      );

      createReadStream().pipe(uploadStream);
    });
  }
}
