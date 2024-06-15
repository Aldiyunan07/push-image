FROM node:20.10.0-alpine as base

WORKDIR /src/app
COPY . .
RUN npm install
RUN npm run pkg

FROM alpine:3.18

COPY --from=base /src/app/.bin/learn-action /usr/local/bin/learn-action
CMD [ "learn-action" ]