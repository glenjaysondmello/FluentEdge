import * as admin from 'firebase-admin';
import * as path from 'path';
import { readFileSync } from 'fs';
import { ServiceAccount } from 'firebase-admin';

const serviceAccountPath = path.resolve(
  process.cwd(),
  'serviceAccountKey.json',
);
const serviceAccount = JSON.parse(
  readFileSync(serviceAccountPath, 'utf8'),
) as ServiceAccount;

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

export default admin;
