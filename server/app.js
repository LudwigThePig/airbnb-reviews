// Imports
require('dotenv').config()
require('newrelic');
const database = require('./dbrouter.js');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');


// Configuration
const app = express();
// Middleware
app.use(express.static('public'));
app.use(bodyParser.json());
app.use(cors());

// Routes
app.get('/api/listings/reviews/:id', (req, res) => {
  let listing_id = req.params.id;

  database.getReviews(listing_id, (err, data) => {
    if (err) {
      res.status(400)
        .json({message: err});
      return;
    }
    res.json(data)
  });
});

module.exports = app;
