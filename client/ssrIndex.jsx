import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/DumbApp.jsx';
import styles from './main.scss';

const Wrap = () => (<div><App /></div>)

ReactDOM.hydrate(<Wrap />, document.getElementById('reviews'));