import styles from '@/App.module.css';
import { sharedPerson } from '@shared/app';
import type { JSX } from 'react';

export const App = (): JSX.Element => {
  return (
    <div className={styles.container}>
      <p className={styles.text}>Hello Vite React boilerplate!</p>
      <p className={styles.text}>{JSON.stringify(sharedPerson)}</p>
    </div>
  );
};
