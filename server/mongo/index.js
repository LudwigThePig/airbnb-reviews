const MongoClient = require('mongodb').MongoClient;
const url = "mongodb://localhost:27017/airbnb_reviews";

const getReviews = (id, cb) => {
  MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {
    if (err) {
      db.close();
      return cb(err, null);
    }
    const dbo = db.db('airbnb_reviews');
    dbo.collection("reviews").find({"test": "test"}, function(err, res) {
      if (err){
        db.close();
        return cb(err, null);
      } 
      db.close();
      return cb(null, res);
    });
  });
};

module.exports = {
  getReviews,
}