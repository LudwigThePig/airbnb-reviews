const app = require('./app.js');
const port = 3004;
const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost:27017/airbnb_reviews';

// Server Setup
if (process.env.DB === 'MONGO') {
  MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
    if (err) {
      db.close();
      return;
    }
    global.db = db;
    app.listen(port, () => {
      console.log(`Listening on localhost:${port} with Mongo in ${process.env.NODE_ENV} mode`);
    })
  })
} else {
  app.listen(port, () => {
    console.log(`Listening on localhost:${port} with Mongo in ${process.env.NODE_ENV} mode`);
  })
}