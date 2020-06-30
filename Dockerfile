FROM strapi/base:12-alpine

WORKDIR /usr/src/app

COPY ./app/package.json ./
COPY ./app/yarn.lock ./

RUN yarn install --network-timeout 100000

COPY ./app/ .

ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]