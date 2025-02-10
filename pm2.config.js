module.exports = {
  apps: [
    {
      name: 'pnpm-ws-template-backend',
      script: 'pnpm',
      args: 'backend start',
    },
    {
      name: 'pnpm-ws-template-frontend',
      script: 'pnpm',
      args: 'frontend start',
    },
  ],
};
