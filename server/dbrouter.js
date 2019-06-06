const mongo = require('./mongo/index.js');
const postgres = require('./db/index.js')

let databaseChoice;

if (process.env.DB === 'MONGO') {
  databaseChoice = mongo;
} else {
  databaseChoice = postgres;
}

module.exports = databaseChoice;