import styles from '@/App.module.css';
import { type Person, sharedPerson } from '@shared/types';
import type { JSX } from 'react';

export const App = (): JSX.Element => {
  const person: Person = sharedPerson;

  return (
    <div className={styles.container}>
      <p className={styles.text}>Hello Vite React boilerplate!</p>
      <p className={styles.text}>{JSON.stringify(person)}</p>
    </div>
  );
};
