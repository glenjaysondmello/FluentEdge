import { Injectable, OnModuleInit } from '@nestjs/common';
import * as admin from 'firebase-admin';
import { ServiceAccount } from 'firebase-admin';
import { existsSync, readFileSync } from 'fs';
import { join } from 'path';

@Injectable()
export class FirebaseService implements OnModuleInit {
  onModuleInit() {
    if (admin.apps.length > 0) return;

    const serviceAccountPath = join(process.cwd(), 'serviceAccountKey.json');
    let serviceAccount: ServiceAccount;

    if (existsSync(serviceAccountPath)) {
      serviceAccount = JSON.parse(
        readFileSync(serviceAccountPath, 'utf-8'),
      ) as ServiceAccount;
    } else {
      serviceAccount = {};
    }

    if (serviceAccount) {
      admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
      });
    } else {
      console.warn(
        'Firebase Service Account not found. Firebase features will be disabled.',
      );
    }
  }
}
