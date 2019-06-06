import sys
import os
import pymongo
import time
import random
from faker import Faker
from datetime import datetime
fake = Faker()

randomText = [
  "Awesome", 'OMG! ', 'JUST. WOW. ', '', '', 'What a blast! ', 'My wife and I really enjoyed the location. ', '', 'Good news everyone! ', 'Very clean and beautiful decore! ', 'Great space. ', 'Unfuhgetable! ', 'It was meh. ', 'It was nice. ', 'From the moment I saw the place I knew it would be a trainwreck. ', 'WARNING: not as advertised. ', 'just as advertised.', 'just what the doctor ordered.', 'breath taking.', 'cute and cozy.', 'lovely.'
]
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

 
 
job_id = '1'
 
if len(sys.argv) < 2:
    sys.exit("You must supply the item_number argument")
elif len(sys.argv) > 2:
    job_id = sys.argv[2]   
 
documents_number = int(sys.argv[1].split('.')[0])
batch_number = 5 * 1000
 
job_name = 'Job#' + job_id
start = datetime.now()
 
# obtain a mongo connection
connection = pymongo.MongoClient("mongodb://localhost")#, safe=True)
 
# obtain a handle to the random database
db = connection.airbnb_reviews
collection = db.reviews
 
batch_documents = [i for i in range(batch_number)]
 
for index in range(documents_number):
    try:           
        date = datetime.fromtimestamp(time.mktime(min_date.timetuple()) + int(round(random.random() * delta)))
        value = random.random()
        document = {
            'text' : fake.sentence(ext_word_list=randomText, nb_words=3),   
            'date' : fake.date(pattern="%Y-%m-%d", end_datetime=None),
            'guest': fake.name().split()[0],
            'photo': random.choice(photos) 
        }
        batch_documents[index % batch_number] = document
        if (index + 1) % batch_number == 0:
            collection.insert(batch_documents)     
        index += 1;
        if index % 100000 == 0:
            print(job_name, ' inserted ', index, ' documents.')
    except:
        print('Unexpected error:', sys.exc_info()[0], ', for index ', index)
        raise
print(job_name, ' inserted ', documents_number, ' in ', (datetime.now() - start).total_seconds(), 's')