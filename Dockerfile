FROM node:20 AS build

WORKDIR /usr/src/app

COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn

RUN yarn

COPY . .

RUN yarn run build
RUN yarn workspaces focus --production

#First build above

FROM node:20-alpine3.21 AS secondbuild

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD [ "yarn", "run", "start:prod" ]