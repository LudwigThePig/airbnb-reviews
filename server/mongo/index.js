const getReviews = (id, cb) => {
  const db = global.db.db('airbnb_reviews');
  const startQuery = new Date();
  db.collection('reviews').find({ _id: {$gte: Number(id) } }).limit(15).toArray((err, documents) => {
    const endQuery = new Date();
    if (err) {
      return console.log(err)
    }
    console.log('query time ', endQuery - startQuery, 'ms');
    return cb(null, documents);
  });
};

module.exports = {
  getReviews,
}