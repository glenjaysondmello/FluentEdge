import Groq from 'groq-sdk';
import { FileUpload } from 'graphql-upload/processRequest.mjs';
import { Readable } from 'stream';

const streamToBuffer = (stream: Readable): Promise<Buffer> => {
  const chunks: any[] = [];
  return new Promise((resolve, reject) => {
    stream.on('data', (chunk) => chunks.push(Buffer.from(chunk)));
    stream.on('error', (err) => reject(err));
    stream.on('end', () => resolve(Buffer.concat(chunks)));
  });
};

export const transcribeAudio = async (
  audioFile: FileUpload,
  client: Groq,
): Promise<string> => {
  try {
    const audioStream = audioFile.createReadStream();
    const audioBuffer = await streamToBuffer(audioStream);

    const uploadableFile = await Groq.toFile(audioBuffer, audioFile.filename);

    const transcription = await client.audio.transcriptions.create({
      file: uploadableFile,
      model: 'whisper-large-v3',
    });

    return transcription.text || '';
  } catch (error) {
    console.error('Groq transcription failed:', error);
    throw new Error('Audio transcription failed.');
  }
};
