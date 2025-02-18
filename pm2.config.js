module.exports = {
  apps: [
    {
      name: 'pnpm-ws-backend',
      script: 'pnpm',
      args: 'backend start',
    },
    {
      name: 'pnpm-ws-frontend',
      script: 'pnpm',
      args: 'frontend start',
    },
  ],
};
