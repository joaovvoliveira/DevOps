# Usando uma imagem oficial do Node.js
FROM node:20 AS build

# Definir diretório de trabalho dentro do container
WORKDIR /usr/src/app

COPY package.json server.js ./

RUN npm install 

# Copiar os demais arquivos
COPY . .

RUN npm install --omit=dev

FROM node:20-alpine3.21

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/server.js ./server.js
# Expor a porta

EXPOSE 3000

# Comando para rodar a aplicação
CMD ["node", "server.js"]
