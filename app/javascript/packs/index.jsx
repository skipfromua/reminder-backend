import React from 'react';
import { createRoot } from 'react-dom/client';
import NavigationPanel from '../Components/NavigationPanel/NavigationPanel'

const App = () => {
  return (
    <NavigationPanel />
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
