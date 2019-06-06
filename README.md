### AirBnB System Design Capston ###

This is the reviews component  of AirBnB's website that has been scaled up to 10,000 requests per second.

KEY TECHNOLOGIES:
- Express node framework
- React framework with webpack/babel for building/transpiling JSX
- Postgres DB
- Knex ORM for Postgres
- Jest and Enzyme for testing
- Styled-Components for CSS in JS

## HOW TO RUN THIS PROJECT:
- Clone this repo
- run `npm install` to install dependencies
- Select and seed a database. [See seeding the section below](#Seeding)
- open two terminals and navigate to the root directory of the project in each
- In each terminal run:
	`npm run start`
	`npm run react-dev`
- navigate to http://localhost:3003 to see the results!


## Seeding
**NOTE: Both seeding scripts require Python 3**

#### Selecting a database.
Create an .env file in the root directory of this application and add 
	- add `DB='MONGO'` for MongoDB
	- add `DB='POSTGRES'` for PostgreSQL

#### MongoDB
- To use MongoDB, navigate to the root directory of your terminal
- Run `.\server\mongo\seed.py`
	- **NOTE**: This will insert ten million documents. To change the number of documents inserted, open up seed.py in server\mongo and change `total_documents_count`.

#### PostgreSQL
- To use PostgreSQL, navigate to the root directory in your terminal and;
	- run `npm run dbinit`.
	- Then run `./server/db/seed.py`.
		- **NOTE**, this will build ten millions insert queries! To change this behavior, change the variables `outerLoop` and `innerLoop`. The total number of inserts will be `innerLoop * outerLoop`. For faster insertions, make sure `innerLoop` is less than 25.
	- Open up the package.json file. In the seed2 script, change postgres to your postgres superuser username.
	- Then run `npm run seed2` in the terminal.
	- **NOTE**, this whole script is pretty slow. Mongo is recommended.

	