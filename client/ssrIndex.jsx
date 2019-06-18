import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/DumbApp.jsx';
import ReactDOMServer from 'react-dom/server';
import styles from './main.scss';

ReactDOM.hydrate(<App />, document.getElementById('reviews'));