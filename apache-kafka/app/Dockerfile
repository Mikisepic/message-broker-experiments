FROM python:3.11.1-alpine3.17 as base

RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]

RUN pip3 install -r requirements.txt

FROM base AS producer_runtime
ENTRYPOINT ["python3", "producer.py"]

FROM base AS consumer_runtime
ENTRYPOINT ["python3", "comsumer.py"]