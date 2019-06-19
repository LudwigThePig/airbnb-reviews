import sys
import pymongo
import time
import subprocess
import multiprocessing
 
from datetime import datetime
 
cpu_count = multiprocessing.cpu_count()
 
# Connect to the database
client = pymongo.MongoClient('mongodb://localhost:27017') 
collection = client.airbnb_reviews.reviews
 
# Limits and insert counts
total_documents_count = 10000000
inserted_documents_count = 0
sleep_seconds = 1
sleep_count = 0

# Start the processes on each thread
for i in range(cpu_count):
    documents_number = str(total_documents_count/cpu_count)
    print(documents_number)
    subprocess.Popen(['python', 'C:/code/hr/SDC/reviews/server/mongo/seed_process.py', documents_number, str(i)])

start = datetime.now()

# Gives updates every minute on the status of the insertions
while (inserted_documents_count < total_documents_count) is True:
    inserted_documents_count = collection.count_documents({})
    if (sleep_count > 0 and sleep_count % 60 == 0): 
        print('Inserted ', inserted_documents_count, ' documents.')
    if (inserted_documents_count < total_documents_count):
        sleep_count += 1
        time.sleep(sleep_seconds)  
 
print('Inserting ', total_documents_count, ' took ', (datetime.now() - start).total_seconds(), 's')
