FROM node:22

ARG DEBIAN_FRONTEND=noninteractive
RUN /usr/bin/apt-get update \
 && /usr/bin/apt-get install --assume-yes jq \
 && rm -rf /var/lib/apt/lists/*

USER node

ENV NETLIFY_AUTH_TOKEN="" \
    PATH="/home/node/docker-netlify-cli/node_modules/.bin:${PATH}"

COPY --chown=node:node package.json /home/node/docker-netlify-cli/package.json

WORKDIR /home/node/docker-netlify-cli
RUN yarn install \
 && yarn cache clean \
 && netlify version

WORKDIR /project

ENTRYPOINT ["/home/node/docker-netlify-cli/node_modules/.bin/netlify"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>"
