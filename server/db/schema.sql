DROP DATABASE IF EXISTS airbnb_reviews;
CREATE DATABASE airbnb_reviews;
\c airbnb_reviews

DROP TABLE IF EXISTS reviews;

CREATE UNLOGGED TABLE reviews (
  id SERIAL NOT NULL,
  text VARCHAR NOT NULL,
  date date NOT NULL,
  guest VARCHAR NOT NULL,
  photo VARCHAR NOT NULL
);
