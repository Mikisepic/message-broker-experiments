docker run -d --rm --net rabbits \
-v {$PWD}/config/rabbit-1/:/config/ \
-e RABBITMQ_CONFIG_FILE=/config/rabbitmq \
-e RABBITMQ_ERLANG_COOKIE=WIWVHCDTCIUAWANLMQAW \
--hostname rabbit-1 \
--name rabbit-1 \
-p 15672:15672 \
rabbitmq:3.11-management

docker run -d --rm --net rabbits \
-v {$PWD}/config/rabbit-2/:/config/ \
-e RABBITMQ_CONFIG_FILE=/config/rabbitmq \
-e RABBITMQ_ERLANG_COOKIE=WIWVHCDTCIUAWANLMQAW \
--hostname rabbit-2 \
--name rabbit-2 \
-p 15673:15672 \
rabbitmq:3.11-management

docker run -d --rm --net rabbits \
-v {$PWD}/config/rabbit-3/:/config/ \
-e RABBITMQ_CONFIG_FILE=/config/rabbitmq \
-e RABBITMQ_ERLANG_COOKIE=WIWVHCDTCIUAWANLMQAW \
--hostname rabbit-3 \
--name rabbit-3 \
-p 15674:15672 \
rabbitmq:3.11-management