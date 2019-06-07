const app = require('./app.js');
const port = 3004;
const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost:27017/';

// Server Setup
if (process.env.DB === 'MONGO') {
  MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
    if (err) {
      db.close();
      return;
    }
    app.locals.db = db;
    app.listen(port, () => {
      console.log(`Listening on localhost:${port}`);
    })
  })
} else {

  app.listen(port, () => {
    console.log(`Listening on localhost:${port}`);
  })
}