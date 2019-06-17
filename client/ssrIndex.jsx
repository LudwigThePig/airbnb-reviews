import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.jsx';
import ReactDOMServer from 'react-dom/server';
import styles from './main.scss';

// ReactDOMServer.renderToString(<App />, document.getElementById('reviews'));
ReactDOM.hydrate(<App />, document.getElementById('reviews'));