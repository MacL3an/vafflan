import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        {/* <img src={logo} className="App-logo" alt="logo" /> */}
        <p>
          Är Våfflan öppen?
          {/* Edit <code>src/App.tsx</code> and save to reload. */}
        </p>
        <a
          className="App-link"
          href="https://www.trailforks.com/trails/vafflan/reports/"
          target="_blank"
          rel="noopener noreferrer"
        >
          Kolla Trailforks!
        </a>
      </header>
    </div>
  );
}

export default App;
