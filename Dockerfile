FROM strapi/base:12-alpine AS BUILD_IMAGE

WORKDIR /usr/src/app

COPY ./app/package.json ./app/yarn.lock ./app/.yarnclean ./

# Run install using lockfile and with increased net timeout
RUN yarn --frozen-lockfile --network-timeout 100000 && \
    yarn cache clean && \
    yarn autoclean --force

COPY ./app/ .

RUN yarn build

FROM strapi/base:12-alpine

ENV NODE_ENV=production

WORKDIR /usr/src/app

# copy from build image
COPY --from=BUILD_IMAGE /usr/src/app ./

EXPOSE 1337

CMD ["yarn", "start"]