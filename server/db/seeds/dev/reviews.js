const data = require('../../dataGenerator.js');
exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('reviews').del()
    .then(() => knex('listings').del())
    .then(() => knex('users').del())
    .then(() => knex('hosts').del())
    .then(() => {
      // Inserts seed entries
      return data.then(data => {
        return Promise.all(data.map(group => {
          return knex('hosts').insert(group.host, 'id')
            .then(host => {
              group.listing.host_id = host[0];
              return knex('listings').insert(group.listing, 'id')
            })
            .then(listing => {
              return Promise.all(group.reviews.map((review, i) => {
                return knex('users').insert(group.users[i], 'id')
                  .then(user => {
                    review.user_id = user[0];
                    review.listing_id = listing[0];
                    return knex('reviews').insert(review);
                  })
                  .catch(error => console.log('Error with users or reviews', error));
              }));
            })
            .catch(error => console.log('error with listing', error));
        }))
          .catch(error => console.log('Error with data.map Promise.all', error));
      });
    });
};
