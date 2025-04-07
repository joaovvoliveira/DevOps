FROM node:20 AS build

WORKDIR /usr/src/app

COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn

RUN corepack enable
RUN corepack prepare yarn@4.8.1 --activate
RUN yarn

COPY . .

RUN yarn run build
RUN yarn workspaces focus --production 

FROM node:20-alpine3.21 AS secondbuild

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/dist ./dist

EXPOSE 3000

CMD ["yarn", "run", "start:prod"]