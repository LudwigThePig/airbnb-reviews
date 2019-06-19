import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/DumbApp.jsx';
import styles from './main.scss';

ReactDOM.hydrate(<App />, document.getElementById('reviews'));