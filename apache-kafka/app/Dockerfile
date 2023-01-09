FROM python:3.11.1-alpine3.17 as base

RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]

ARG USERNAME
ARG HOMEDIR

ENV USERNAME=${USERNAME}
ENV HOMEDIR=${HOMEDIR}

WORKDIR $HOMEDIR
COPY . $HOMEDIR

RUN addgroup -S docker
RUN adduser \
  --disabled-password \
  --gecos "" \
  --home $HOMEDIR \
  --ingroup docker \
  $USERNAME

USER $USERNAME

RUN pip3 install -r requirements.txt

FROM base AS producer_runtime
ENTRYPOINT ["python3", "producer.py"]

FROM base AS consumer_runtime
ENTRYPOINT ["python3", "comsumer.py"]