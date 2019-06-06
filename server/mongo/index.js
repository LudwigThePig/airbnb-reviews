const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost:27017/airbnb_reviews';

const getReviews = (id, cb) => {
  console.log('you are using MongoDB');
  MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
    if (err) {
      db.close();
      return cb(err, null);
    }
    const dbo = db.db('airbnb_reviews');
    dbo.collection('reviews').find().limit(10).toArray((err, documents) => {
      if (err){
        db.close();
        return cb(err, null);
      } 
      db.close();
      console.log(documents)
      return cb(null, documents);
    });
  });
};

module.exports = {
  getReviews,
}