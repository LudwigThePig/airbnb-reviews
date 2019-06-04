### AIRBNB_CLONE PROJECT ###

This is the reviews component of my team's project mocking an airbnb page for a listing.

KEY TECHNOLOGIES:
- Express node framework
- React framework with webpack/babel for building/transpiling JSX
- Postgres DB
- Knex ORM for Postgres
- Jest and Enzyme for testing
- Styled-Components for CSS in JS

HOW TO RUN THIS PROJECT:
- download
- npm install
- open two terminals and navigate to the root directory of the project in each
- In each terminal run:
	'npm run start'
	'npm run react-dev'
- this will start the local server on port 3003 and build the webpack bundle.js file
- navigate to http://localhost:3003 to see the results!

PROJECT STRUCTURE:
- Client directory contains all React Components (with tests) to be bundled
- Public directory contains the bundled webpack file bundle.js and index.html
- Server directory contains
	- the express server file server.js
	- db directory containing
		- knex migration/seed folders/files 
		- dataGenerator.js for building fake data
	- __test__ containing basic database tests in jest
- downloadImages.js for downloading/resizing images from Unsplash.com to be used for listing, user, and host photos
- config files
	- webpack/babelrc/package.json
