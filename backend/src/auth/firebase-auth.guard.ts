import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import admin from './firebase.service';
import { GqlExecutionContext } from '@nestjs/graphql';
import { Request } from 'express';
import { DecodedIdToken } from 'firebase-admin/auth';

interface AuthenticatedRequest extends Request {
  user?: DecodedIdToken;
}

@Injectable()
export class FirebaseAuthGuard implements CanActivate {
  async canActivate(context: ExecutionContext): Promise<boolean> {
    const gqlContext = GqlExecutionContext.create(context);

    const ctx = gqlContext.getContext<{ req: AuthenticatedRequest }>();
    const request = ctx.req;

    const authHeader = request.headers.authorization;
    if (!authHeader) {
      return false;
    }

    const token = authHeader.split('Bearer ')[1];
    if (!token) {
      return false;
    }

    try {
      const decodedToken = await admin.auth().verifyIdToken(token);
      request.user = decodedToken;
      return true;
    } catch (err) {
      console.error('Error: ', err);
      return false;
    }
  }
}
