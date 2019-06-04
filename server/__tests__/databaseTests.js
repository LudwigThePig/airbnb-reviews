const database = require('../db/dbConfig.js');

describe('Test Validity of Database Contents', () => {



  describe('test if all tables exist:', () => {

    test('test if "users" table exists and holds proper data', (done) => {
      database.select('*').from('users')
        .then(userDataList => {
          let first = userDataList[0];
          let columns = Object.keys(first);

          expect(userDataList.length).toBeLessThanOrEqual(2000);
          expect(columns).toEqual(expect.arrayContaining(['id', 'name', 'photoUrl']))
          expect(typeof first.id).toBe('number');
          expect(typeof first.name).toBe('string');
          expect(typeof first.photoUrl).toBe('string');
          done();
        })
        .catch(e => console.error('1', e));
    });

    test('test if "hosts" table exists and holds proper data', (done) => {
      database.select('*').from('hosts')
        .then(hostDataList => {
          let aHost = hostDataList[0];
          let columns = Object.keys(aHost);

          expect(hostDataList.length).toBe(100);
          expect(columns).toEqual(expect.arrayContaining(['id', 'name', 'description', 'hostUrl', 'dateJoined', 'language', 'responseRate', 'responseTime']))
          done();
        })
        .catch(e => console.error('2', e));
    });

    test('test if "listings" table exists and holds proper data', (done) => {
      database.select('*').from('listings')
        .then(listingsData => {
          let aListing = listingsData[0];
          let columns = Object.keys(aListing);

          expect(listingsData.length).toBe(100);
          expect(columns).toEqual(expect.arrayContaining(['id', 'title', 'description', 'city', 'state', 'country', 'cost', 'capacity', 'type', 'bedrooms', 'beds', 'baths', 'photoUrl', 'host_id']));
          done();
        })
        .catch(e => console.error('3', e));
    });

    test('test if reviews table exists and holds proper data', (done) => {
      database.select('*').from('reviews')
        .then(reviewsData => {
          let aReview = reviewsData[0];
          let columns = Object.keys(aReview);

          expect(reviewsData.length).toBeLessThanOrEqual(2000);
          expect(columns).toEqual(expect.arrayContaining(['id', 'text', 'date', 'user_id', 'listing_id']));
          done();
        })
        .catch(e => console.error('4', e));
    });
  });



  describe('tests for foreign keys and quantity relationships:', () => {

    test('test if all reviews are linked to a valid listing', (done) => {
      database('reviews').select('listing_id').join('listings', { 'listing_id': 'listings.id' })
        .then(data => {
          database.select('listing_id').from('reviews')
            .then(reviews => {
              expect(data.length).toEqual(reviews.length);
              done();
            })
            .catch(e => console.error('5', e));
        });
    });

    test('test if "listings" table "host_id"s are valid', (done) => {
      database('listings').select('host_id').join('hosts', { 'host_id': 'hosts.id' })
        .then(ids => {
          expect(ids.length).toBe(100);
          done();
        })
        .catch(e => console.error('6', e));
    });

    test('test if number of "users" equals number of "reviews"', (done) => {
      database.select('*').from('users').then(usersData => {
        database.select('*').from('reviews').then(reviewsData => {
          expect(usersData.length).toEqual(reviewsData.length);
          done();
        })
          .catch(e => console.error('7', e));
      });
    });

    test('test if each user is linked to one review', (done) => {
      database('reviews').select('user_id').join('users', { 'user_id': 'users.id' }).then(matchingData => {
        database('users').select('id').then(userData => {
          expect(matchingData.length).toEqual(userData.length);
          done();
        })
          .catch(e => console.error('8', e));
      })
    })
  });



  describe('test if all table urls are valid:', () => {

    test('test if "photoUrl" of "users" is a valid url', (done) => {
      database('users').select('photoUrl').where({ 'id': 1 })
        .then(data => {
          expect((/^https?/).test(data[0].photoUrl)).toEqual(true);
          done();
        });
    });


    test('test if "hostUrl" is a valid link in "hosts" table', (done) => {
      database('hosts').select('hostUrl').where({ 'id': 1 })
        .then(data => {
          expect((/^https?/).test(data[0].hostUrl)).toEqual(true);
          done();
        });
    });

    test('test if "photoUrl" is a valid link in "listings" table', (done) => {
      database('listings').select('photoUrl').where({ 'id': 1 })
        .then(data => {
          expect((/^https?/).test(data[0].photoUrl)).toEqual(true);
          done();
        });
    });
  });
});