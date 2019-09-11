FROM node:10.16.3-alpine

ARG NETLIFY_CLI_VERSION="2.14.0"

USER node

ENV NETLIFY_AUTH_TOKEN="" \
    NODE_ENV="production" \
    NPM_CONFIG_GLOBAL="true" \
    NPM_CONFIG_PRODUCTION="true" \
    NPM_CONFIG_PREFIX="/home/node/.npm-global"

RUN /usr/local/bin/npm install netlify-cli@${NETLIFY_CLI_VERSION} \
 && /usr/local/bin/npm cache clean --force

WORKDIR /project

ENTRYPOINT ["/home/node/.npm-global/bin/netlify"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.version=${NETLIFY_CLI_VERSION}
