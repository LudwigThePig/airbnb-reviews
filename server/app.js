// Imports
require('dotenv').config()
// require('newrelic');
const database = require('./dbrouter.js');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Crazy SSR stuff
const browserify = require('browserify');
const React = require('react');
const ReactDOMServer = require('react-dom/server');
const DumbApp = require('../babelDist/app.js');
const DOM = require('react-dom-factories');
const body = DOM.body, div = DOM.div, script = DOM.script


// Configuration
const app = express();
// Middleware
app.use(express.static('public'));
app.use(bodyParser.json());
app.use(cors());


// More crazy SSR stuff
app.get('/ssr', (req, res) => {
  const html = ReactDOMServer.renderToStaticMarkup(DumbApp);
  console.log(html);
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
