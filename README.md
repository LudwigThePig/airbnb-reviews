### AirBnB System Design Capston ###

This is the reviews microservice of Cloudbnb, an Airbnb like application. I inherited this code from one of my cohort mates at Hack Reactor and scaled the service to handle 5,000 requests per second on an AWS EC2 instance. 

## Demo/ Proof of Concept 
The images below showcase the proxy server throughput speed during a stress test. The proxy handled up to 5,000 requests per second and sustained 2,000 requests per seconds. Requests were processed in about 4ms and total round trips were under 250ms.

We achieved these results by server side rendering our components and using Redis the most commonly requested responses. The requests were weighted towards the back quarter of the database. With 1gb of RAM and 10 million records to choose from, we were able to cache about 2/3 of responses.

This data is representative of one EC2 instance per proxy and service and the major bottle neck was at the proxy. So, if we added an additional EC2 instance or added extra RAM, we could handle more requests. The infrastructure is already there to scale the service. There is an Nginx loadbalancer above every service and the proxy and there are private EC2 AMI for each service and proxy. One would just need to create a new image and add the new instance to the loadbalancer to scale the application.

![New Relic Dashboard](https://i.imgur.com/M1oZKH8.jpg)
![AWS CloudWatch Dashboard](https://i.imgur.com/Q5d2Z0B.jpg)

## Key Technologies:
- Amazon Web Services, EC2
- Redis
- Nginx
- Express
- React
- ReactDOMServer for server side rendering.
- MongoDB
- Jest and Enzyme for testing
- Sass
- New Relic


## Related Repos

#### Reverse Proxy, Created by myself
- https://github.com/montyjs/cloudbnb-proxy
#### Images Service. Created by [Jordan Boles](https://github.com/jboles31)
  - https://github.com/montyjs/tour-this-place
#### Ameneties Service. Created by [Trevor Markel](https://github.com/tmarkel6849)
  - https://github.com/montyjs/checkout-tm-service
#### Host Profile Service. Created by [Ron Propri](https://github.com/rpropri)
  - https://github.com/fourprofessionalguys/host-profile

## HOW TO RUN THIS PROJECT:
- Clone this repo and navigate to the root directory in your terminal
- Run `npm install` in the terminal to install dependencies
- Select and seed a database. [See the seeding the section below](#Seeding)
- Run `npm run react-dev` to build the webpack bundle:
- In another terminal window, run `npm start` to start the server
- Navigate to http://localhost:3003 to see the results!


## Seeding
**This service uses MongoDB. Ensure that you have Mongo 4.0 or greater installed.**
- Navigate to the root directory in your terminal and run `.\server\mongo\seed.py`
	- *Note*: This will insert ten million documents. To change the number of documents inserted,
		- open up mongo/seed.py and change `total_documents_count`.
		- Then, if you are inserting fewer than 40,000 documents, open mongo/seed_process.py and change `batch_number` to a value that is at most `(total_documents_count/threads)`, where threads is the number of threads your CPU contains. If you are unsure of how many threads you have, divide by 10.
- Open the mongo shell and run `use airbnb_reviews` to connect to the database.
- Then, run `db.reviews.createIndex({listing_id: 1})` to index the database for faster queries. 