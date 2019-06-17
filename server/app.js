// Imports
require('dotenv').config()
// require('newrelic');
const database = require('./dbrouter.js');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Crazy SSR stuff
const React = require('react');
const ReactDOMServer = require('react-dom/server');
const TranspiledApp = require('../babelDist/App.js').default;
// const RawApp = React.createFactory(require('../client/components/App.jsx'));

// Configuration
const app = express();
// Middleware
app.use(express.static('public'));
app.use(bodyParser.json());
app.use(cors());


// More crazy SSR stuff
app.get('/ssr', (req, res) => {
  const html = ReactDOMServer.renderToStaticMarkup(TranspiledApp);
  console.log(html);
  console.log(React.isValidElement(TranspiledApp))
  res.send(html);
});

// Routes
app.get('/api/listings/reviews/:id', (req, res) => {
  let listing_id = req.params.id;
  console.log('we made it!')
  database.getReviews(listing_id, (err, data) => {
    if (err) {
      res.status(400)
        .json({message: err});
      return;
    }
    res.json(data);
  });
});

module.exports = app;
