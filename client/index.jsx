import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.jsx';
import ReactDOMServer from 'react-dom/server';

ReactDOMServer.renderToString(<App />, document.getElementById('reviews'));
// ReactDOM.render(<App />, document.getElementById('reviews'));