// Imports
require('dotenv').config()
// require('newrelic');
const database = require('./dbrouter.js');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const fs = require('fs');
const port = 3004;
const MongoClient = require('mongodb').MongoClient;
const url = process.env.MONGO_CONNECTION || 'mongodb://localhost:27017/airbnb_reviews';
const path = require('path');

// Crazy SSR stuff

import renderer from './renderer';

// Configuration
const app = express();
// Middleware
// app.use(express.static('public'));
app.use(bodyParser.json());
app.use(cors());


// More crazy SSR stuff
app.get('/', (req, res) => {
  fs.readFile('./server/coolerIndex.html', 'utf-8', (err, file) => {
    if(err) {
      res.status(400).send(err);
    }
    database.getReviews(100, (err, data) => {
      if (err) {
        res.status(400)
          .json({message: err});
        return;
      }
      const html = renderer(file, data);
      res.send(html);
    });
  });
});

// Routes
app.get('/api/listings/reviews/:id', (req, res) => {
  let listing_id = req.params.id;
  database.getReviews(listing_id, (err, data) => {
    if (err) {
      res.status(400)
        .json({message: err});
      return;
    }
    res.json(data);
  });
});

MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
  if (err) {
    return console.error(err);
  }
  global.db = db;
  app.listen(port, () => {
    console.log(`Listening on localhost:${port} with Mongo in ${process.env.NODE_ENV} mode`);
  });
});