import React from 'react';
import PrimaryButton from '../Components/UI/buttons/PrimaryButton';
import { createRoot } from 'react-dom/client';

const App = () => {
  return (
    <PrimaryButton>Hello</PrimaryButton>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('root');
  if (!rootElement) {
    return;
  }
  const root = createRoot(rootElement);
  root.render(<App/>);
});
