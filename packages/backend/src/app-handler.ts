import { printHello } from '@/printHello';
import { type Person, sharedPerson } from '@shared/app';
import { Hono } from 'hono';
import { type LambdaContext, type LambdaEvent, handle } from 'hono/aws-lambda';

type Bindings = {
  event: LambdaEvent;
  lambdaContext: LambdaContext;
};

const app = new Hono<{ Bindings: Bindings }>();

app.get('/app', (c) => {
  console.log('start handle app');
  printHello();
  const person: Person = sharedPerson;
  console.log(person);
  const requestId = c.env.lambdaContext.awsRequestId;
  console.log('requestId', requestId);
  return c.text(`Hello! requestID: ${requestId}`);
});

export const handler = handle(app);
