FROM node:16.14.1-alpine3.15

RUN /sbin/apk add --no-cache bash

USER node

ENV NETLIFY_AUTH_TOKEN="" \
    PATH="/home/node/docker-netlify-cli/node_modules/.bin:${PATH}"

COPY --chown=node:node package.json /home/node/docker-netlify-cli/package.json

WORKDIR /home/node/docker-netlify-cli
RUN /usr/local/bin/yarn \
 && /usr/local/bin/yarn cache clean

WORKDIR /project

ENTRYPOINT ["/home/node/docker-netlify-cli/node_modules/.bin/netlify"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>"
