import * as admin from 'firebase-admin';
import * as path from 'path';

const serviceAccount = path.resolve(__dirname, '../../serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(require(serviceAccount)),
});

export default admin;