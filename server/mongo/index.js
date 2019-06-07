const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost:27017/';

const getReviews = (id, db, cb) => {
  const dbo = db.db('airbnb_reviews');
  const startQuery = new Date();
  dbo.collection('reviews').find({ _id: {$gte: Number(id) } }).limit(15).toArray((err, documents) => {
    const endQuery = new Date();
    console.log('query time ', endQuery - startQuery, 'ms');
    return cb(null, documents);
  });
};

module.exports = {
  getReviews,
}