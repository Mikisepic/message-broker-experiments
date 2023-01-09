FROM python:3.11.1-alpine3.17 AS base

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

FROM base AS runtime

RUN pip3 install redis
CMD ["python3", "client.py"]
RUN sleep 1d