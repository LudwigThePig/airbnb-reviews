import sys
import os
import pymongo
import time
import random
from faker import Faker
from datetime import datetime
fake = Faker()

starter = ['OMG! ', 'JUST. WOW. ', '', '', 'What a blast! ', 'My wife and I really enjoyed the location. ', '', 'Good news everyone! ', 'Very clean and beautiful decore! ', 'Great space. ', 'Unfuhgetable! ', 'It was meh. ', 'It was nice. ', 'From the moment I saw the place I knew it would be a trainwreck. ', 'WARNING: not as advertised. ']
hostAdjective = ['very helpful and pleasant', 'warm and friendly', 'kinda a jerk', 'charming', 'nice but couldn\'t stop talking about her cats', 'friendly']
location = ['house', 'home', 'house', 'apartment', 'townhouse', 'house', 'apartment', 'villa', 'apartment']
locationAdjective = ['just as advertised.', 'just what the doctor ordered.', 'breath taking.', 'cute and cozy.', 'lovely.']
stayAdjective = ['interesting to say the least.', 'quite pleasent.', 'fun and relaxing.', 'well worth the price.']
ending = ['In conclusion ', 'all in all ', '', '', '', '']
ending2 = [' would say things went very well.', ' had a great time.', ' absolutely loved my time there.', ' we had a wonderful stay.', ' hated it.', ' would never go back.', 't was great.']


photos = [
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_aLT-JhaNqIU.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_bVPtaf-8jI8.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_gtpm-tiTr9U.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_j7Z-XUHHN40.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_koE9TOrYrgo.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_m663zRzRe40.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_qDs5alqjJAk.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_r3pqFjVmrQU.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ufWjkFmTNXo.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg',
  'https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_yki80w96VZ0.jpeg'
]

min_date = datetime(2012, 1, 1)
max_date = datetime(2013, 1, 1)
delta = (max_date - min_date).total_seconds()
 
job_id = '1'
 
if len(sys.argv) < 2:
    sys.exit('You must supply the item_number argument')
elif len(sys.argv) > 2:
    job_id = sys.argv[2]   

# the total number of documents that this process will insert
documents_number = int(sys.argv[1].split('.')[0])

# The size of teh batches
batch_number = 5000

# Accessory variables for log statements
job_name = 'Job#' + job_id
start = datetime.now()
 
connection = pymongo.MongoClient('mongodb://localhost') 
db = connection.airbnb_reviews
collection = db.reviews2

# Build the batch array
batch_documents = [i for i in range(batch_number)]
for index in range(documents_number):
    try:
        # Generate a sentence with a random choices from the above arrays
        random_review = random.choice(starter) + 'The host was ' + random.choice(hostAdjective) +  ' and the ' + random.choice(location) + ' was ' + random.choice(locationAdjective) + 'The ' + random.choice(['two', 'three', 'four', 'five']) + ' days I spent there were ' + random.choice(stayAdjective) + ' ' + random.choice(ending) + 'I' + random.choice(ending2)

        # Set the appropriate _id without collision from parallel processes
        docId = (index + 1) + ((int(job_id)) * documents_number)
        
        # The actual document
        document = {
            '_id' : docId,
            'listing_id': random.randint(0, 1000000),
            'text' : random_review,
            'date' : fake.date(pattern='%Y-%m-%d', end_datetime=None),
            'guest': fake.name().split()[0],
            'photo': random.choice(photos)
        }
        
        # place document into it's specified index
        batch_documents[index % batch_number] = document

        # Batching the inserts
        if (index + 1) % batch_number == 0:
            collection.insert_many(batch_documents)   

        index += 1

        # Status updates
        if index % 100000 == 0:
            print(job_name, ' inserted ', index, ' documents.')
    except:
        print('Unexpected error:', sys.exc_info()[0], ', for index ', index)
        raise
print(job_name, ' inserted ', documents_number, ' in ', (datetime.now() - start).total_seconds(), 's')