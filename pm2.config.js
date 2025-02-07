module.exports = {
  apps: [
    {
      name: 'backend',
      cwd: './packages/backend',
      script: 'pnpm',
      args: 'start',
      interpreter: '/bin/bash',
    },
    {
      name: 'frontend',
      cwd: './packages/frontend',
      script: 'pnpm',
      args: 'start',
      interpreter: '/bin/bash',
    }
  ],
};
