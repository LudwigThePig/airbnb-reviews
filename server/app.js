// Imports
require('dotenv').config()
require('newrelic');
const database = require('./dbrouter.js');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Crazy SSR stuff
const browserify = require('browserify');
const React = require('react');
const ReactDOMServer = require('react-dom/server');
const DumbApp = React.createFactory(require('../client/components/DumbComponent.js'));
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
  const html = ReactDOMServer.renderToStaticMarkup(
    body(
      null,
      div({
        id: 'reviews',
        dangerouslySetInnerHTML: {__html: ReactDOMServer.renderToString(DumbApp())},
      }),
      script({src: 'https://cdn.jsdelivr.net/npm/react@16.7.0/umd/react.production.min.js'}),
      script({src: 'https://cdn.jsdelivr.net/npm/react-dom@16.7.0/umd/react-dom.production.min.js'}),
      script({src: 'https://cdn.jsdelivr.net/npm/react-dom-factories@1.0.2/index.min.js'}),
      script({src: 'https://cdn.jsdelivr.net/npm/create-react-class@15.6.3/create-react-class.min.js'}),
    )
  );
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
