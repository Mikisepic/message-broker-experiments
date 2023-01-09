import os
import redis
import time

r = redis.Redis(
  host=os.environ['REDIS_HOST'],
  port=os.environ['REDIS_PORT'],
  password=os.environ['REDIS_PASSWORD']
)

start = time.perf_counter()

for i in range(10000):
  r.rpush('my_list', 'Message {}'.format(i))

end = time.perf_counter()
print(f"Completed in {end - start:0.4f} seconds")
