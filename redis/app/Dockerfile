FROM python:3.11.1-alpine3.17 AS base

RUN apk add --no-cache bash

SHELL ["/bin/bash", "-c"]

WORKDIR /app
COPY . /app

RUN pip3 install -r requirements.txt

FROM base AS runtime

CMD ["python3", "client.py"]