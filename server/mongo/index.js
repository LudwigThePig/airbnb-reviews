const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost:27017/';

const getReviews = (id, cb) => {
  const startConnection = new Date();
  MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
    const endConnection = new Date();
    
    if (err) {
      db.close();
      return cb(err, null);
    }
    const dbo = db.db('airbnb_reviews');
    const startQuery = new Date();
    dbo.collection('reviews').find({ _id: {$gte: Number(id) } }).limit(15).toArray((err, documents) => {
      if (err){
        db.close();
        return cb(err, null);
      } 
      const endQuery = new Date();
      console.log('connection time ', endConnection - startConnection, 'ms');
      console.log('query time ', endQuery - startQuery, 'ms');

      db.close();
      return cb(null, documents);
    });
  });
};

module.exports = {
  getReviews,
}