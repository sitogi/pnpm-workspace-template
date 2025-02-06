import react from '@vitejs/plugin-react';
import { defineConfig } from 'vitest/config';
import tsconfigPaths from "vite-tsconfig-paths";

export default defineConfig({
  plugins: [react(), tsconfigPaths()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['./vitest.setup.ts'],
    include: ['test/**/*.{test,spec}.?(c|m)[jt]s?(x)'],
    exclude: ['src', 'node_modules', 'dist', '.idea', '.git', '.cache']
  }
});
