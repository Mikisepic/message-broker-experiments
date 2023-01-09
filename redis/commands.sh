# Replicas
docker run -d --rm --name redis_0 --net redis -v {$PWD}/config/redis_0:/etc/redis/ redis:7.0.7-alpine3.17 redis-server /etc/redis/redis.conf
docker run -d --rm --name redis_1 --net redis -v {$PWD}/config/redis_1:/etc/redis/ redis:7.0.7-alpine3.17 redis-server /etc/redis/redis.conf
docker run -d --rm --name redis_2 --net redis -v {$PWD}/config/redis_2:/etc/redis/ redis:7.0.7-alpine3.17 redis-server /etc/redis/redis.conf

# Sentinels
docker run -d --rm --name sentinel_0 --net redis -v {$PWD}/sentinels/sentinel_0:/etc/redis/ redis:7.0.7-alpine3.17 redis-sentinel /etc/redis/sentinel.conf
docker run -d --rm --name sentinel_1 --net redis -v {$PWD}/sentinels/sentinel_1:/etc/redis/ redis:7.0.7-alpine3.17 redis-sentinel /etc/redis/sentinel.conf
docker run -d --rm --name sentinel_2 --net redis -v {$PWD}/sentinels/sentinel_2:/etc/redis/ redis:7.0.7-alpine3.17 redis-sentinel /etc/redis/sentinel.conf

# Python script
docker build ./app -t mipu/python:3.11.1-alpine3.17
docker run -it --rm --net redis mipu/python:3.11.1-alpine3.17