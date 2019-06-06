const MongoClient = require('mongodb').MongoClient;
const url = "mongodb://localhost:27017/airbnb_reviews";

MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
  if (err) {
    return console.log('Failed to connect to DB', err);
  }
  console.log('You are connected to MongoDB!');
  const dbo = db.db('airbnb_reviews');
  // dbo.createCollection('reviews', (err, collection) => {
  //   if (err) {
  //     return console.log(err);
  //   }
  //   console.log('Collection created!')
  // })
  dbo.collection("reviews").insertOne({"test": "test"}, function(err, res) {
    if (err) throw err;
    console.log("1 document inserted");
    db.close();
  });
  db.close();
});