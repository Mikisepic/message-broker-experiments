FROM python:3.11.1-alpine3.17 as base

RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]

WORKDIR /app
COPY . /app

RUN pip3 install -r requirements.txt

FROM base AS receiver_runtime
ENTRYPOINT ["python3", "receive.py"]

FROM base AS sender_runtime
ENTRYPOINT ["python3", "send.py"]