/* eslint-disable no-console */
const { Pool } = require('pg');

const pool = process.env.NODE_ENV === 'production'
  ? new Pool({
    connectionString: process.env.DB_URI,
  })
  : new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'airbnb_reviews',
    password: 'rei',
    port: '5432',
  });

const getReviews = (id, cb) => {
  console.log(id);
  const queryString = 'SELECT * FROM reviews LIMIT 15;';
  pool.query(queryString, (err, result) => {
    if (err) {
      console.log(err);
      return cb(err, null);
    }
    return cb(null, result.rows);
  });
};

module.exports = {
  pool,
  getReviews,
}