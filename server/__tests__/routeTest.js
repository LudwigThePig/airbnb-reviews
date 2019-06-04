import request from 'supertest';
const app = require('../app.js');

function customPost(url, body) {
  const httpRequest = request(app).post(url);
  httpRequest.send(body);
  httpRequest.set('Accept', 'application/json')
  httpRequest.set('Content-Type', 'application/json')
  httpRequest.set('Origin', 'http://localhost:3003')
  return httpRequest;
}

describe('test paths', () => {

  test('root path should respond with status code 200', (done) => {
    request(app).get('/').then(response => {
      expect(response.statusCode).toEqual(200);
      done();
    });
  });

  test('route /reviews should respond with 201 and reviews array', (done) => {
    request(app).get('/api/listings/reviews/2').then(response => {
      let reviewProps = Object.keys(response.body[0]);
      expect(response.statusCode).toEqual(201);
      expect(Array.isArray(response.body)).toEqual(true);
      expect(reviewProps).toEqual(expect.arrayContaining(['text', 'date', 'user', 'photo']));
      done();
    });
  });

  test('route /reviews should respond with status code 400 when listingId is not a number for get to /reviews/:listingId', (done) => {
    request(app).get('/api/listings/reviews/a1').then(response => {
      expect(response.statusCode).toEqual(400);
      done();
    });
  });

  test('route /reviews should respond with status code 400 when listingId is not between 1 and 100 for get to /reviews/:listingId', (done) => {
    request(app).get('/api/listings/reviews/1000').then(response => {
      expect(response.statusCode).toEqual(400);
      done();
    });
  });
});