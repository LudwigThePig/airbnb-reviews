module.exports = {

  development: {
    client: 'pg',
    connection: {
      user: 'postgres',
      // host: 'localhost',
      password: 'rei',
      database: 'airbnb_clone_reviews'
    },
    useNullAsDefault: true,
    charset: 'utf8',
    migrations: {
      directory: __dirname + '/server/db/migrations'
    },
    seeds: {
      directory: __dirname + '/server/db/seeds/dev'
    }
  },

  // test: {
  //   client: 'pg',
  //   connection: 'postgres://postgres:rei@localhost/airbnb_clone_reviews',
  //   migrations: {
  //     directory: __dirname + '/server/db/migrations'
  //   },
  //   seeds: {
  //     directory: __dirname + '/server/db/seeds/dev'
  //   }
  // },

  // staging: {
  //   client: 'postgresql',
  //   connection: {
  //     database: 'airbnb_clone_reviews',
  //     user: 'postgres',
  //     password: 'rei'
  //   },
  //   pool: {
  //     min: 2,
  //     max: 10
  //   },
  //   migrations: {
  //     tableName: 'knex_migrations'
  //   }
  // },

  production: {
    client: 'postgresql',
    connection: {
      database: 'airbnb_clone_reviews',
      user: 'postgres',
      password: 'rei'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }

};
