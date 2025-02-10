module.exports = {
  apps: [
    {
      name: 'pnpm-ws-template-backend',
      cwd: './packages/backend',
      script: 'pnpm',
      args: 'start',
      interpreter: '/bin/bash',
    },
    {
      name: 'pnpm-ws-template-frontend',
      cwd: './packages/frontend',
      script: 'pnpm',
      args: 'start',
      interpreter: '/bin/bash',
    }
  ],
};
