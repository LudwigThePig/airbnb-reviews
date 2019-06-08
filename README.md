### AirBnB System Design Capston ###

This is the reviews service from AirBnB's website. I inherited this code from one of my cohort mates at Hack Reactor and scaled the service to handle 10,000 requests per second on an AWS EC2 instance.

KEY TECHNOLOGIES:
- Express node framework
- React framework with webpack/babel for building/transpiling JSX
- PostgreSQL
- MongoDB
- Knex ORM for Postgres
- Jest and Enzyme for testing
- Sass

## HOW TO RUN THIS PROJECT:
- Clone this repo and navigate to the root directory in your terminal
- Run `npm install` in the terminal to install dependencies
- Select and seed a database. [See the seeding the section below](#Seeding)
- Run `npm run react-dev` to build the webpack bundle:
- In another terminal window, run `npm start` to start the server
- Navigate to http://localhost:3003 to see the results!


## Seeding
**NOTE: Both seeding scripts require Python 3**

#### Selecting a database.
Create an .env file in the root directory of this application and add 
	- `DB='MONGO'` for MongoDB
	- `DB='POSTGRES'` for PostgreSQL

#### MongoDB (recommended)
- To use MongoDB, ensure that you have Mongo 4.0 or greater installed.
- Navigate to the root directory in your terminal and run `.\server\mongo\seed.py`
	- *Note*: This will insert ten million documents. To change the number of documents inserted,
		- open up mongo/seed.py and change `total_documents_count`.
		- Then, if you are inserting fewer than 40,000 documents, open mongo/seed_process.py and change `batch_number` to a value that is at most `(total_documents_count/threads)`, where threads is the number of threads your CPU contains. If you are unsure of how many threads you have, divide by 10.
- Open the mongo shell and run `use airbnb_reviews` to connect to the database.
- Then, run `db.reviews.createIndex({listing_id: 1})` to index the database for faster queries. 

#### PostgreSQL
- To use PostgreSQL, navigate to the root directory in your terminal and;
	- run `npm run dbinit`.
	- Then run `./server/db/seed.py`.
		- *Note*, this will build ten millions insert queries! To change this behavior, change the variables `outerLoop` and `innerLoop`. The total number of inserts will be `innerLoop * outerLoop`. For faster insertions, make sure `innerLoop` is less than 25.
	- Open up the package.json file. In the seed2 script, change postgres to your postgres superuser username.
	- Then run `npm run seed2` in the terminal.
	- *Note*, this whole script is pretty slow. Mongo is recommended.

	