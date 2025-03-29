# 

# cada pacote do docker hub tras varias imagens como dependencias por baixo dos panos
# filtrando por node:18-slim ele traz uma imagem com menos dependencias, sendo mais leves
# O Docker file aponta por padrao para o Docker Hub

# Instrucoes do dockerfile
# FROM: indica qual imagem base sera utilizada
# WORKDIR: indica qual sera o diretorio de trabalho
# COPY: copia arquivos do host para o container
# RUN: executa comandos no terminal do container
# EXPOSE: expoe uma porta do container
# CMD: executa um comando ao iniciar o container

FROM node:20-slim

# é necessario definir o diretorio de trabalho pois se nao definir ele cria na raiz
# Caso nao exista ele cria o diretorio
WORKDIR /usr/src/app

# Copia o package.json pois o container precisa saber quais sao as dependencias
# O ponto final indica que o arquivo sera copiado para WORKDIR
COPY package.json ./

# Executa o comando yarn para instalar as dependencias necessarias
RUN yarn

# Copia o restante dos arquivos para o WORKDIR. O . indica que todos os arquivos serao copiados
COPY . .

RUN yarn run build

# Obrigatorio expor uma porta qualquer para o container (3000 porta padrao)
EXPOSE 3000

# Comando que sera executado quando se iniciar o container
CMD ["yarn","run", "start"]

# o . no final do comando indica que o comando sera executado no WORKDIR
# docker build -t api . -> cria a imagem
# docker run -p 3000:3000 api -> roda a imagem
# -p -> mapeia a porta do container para a porta do host
# --rm -> remove o container apos a execucao
# -d -> roda o container em background
# -it -> roda o container em modo interativo
# -v -> mapeia um volume
# -e -> passa variaveis de ambiente
# --name -> da um nome ao container
# docker exec -it <nome_container> bash -> entra no container
# docker stop <nome_container> -> para o container
# docker ps -> lista os containers em execucao
# docker ps -a -> lista todos os containers
# docker images -> lista as imagens
# docker rmi <nome_imagem> -> remove a imagem
# docker rm <nome_container> -> remove o container
# docker logs <nome_container> -> mostra os logs do container
# docker inspect <nome_container> -> mostra informacoes do container
# docker image inspect <nome_api> -> mostra informacoes da imagem
# docker image tag <nome_api> <nome_api>:<tag> -> cria uma tag para a imagem
# docker image push <nome_api>:<tag> -> envia a imagem para o docker hub
# docker image pull <nome_api>:<tag> -> baixa a imagem do docker hub











# docker image history <nome_api> -> mostra o historico de criacao da imagem








# Createad with Copilot:

# Use a Node.js base image
#FROM node:16
# Set the working directory inside the container
#WORKDIR /app
# Copy package.json and package-lock.json
#COPY package*.json ./
# Install dependencies
#RUN npm install
# Copy the application source code
#COPY . .
# Expose the application port
#EXPOSE 3000
# Start the application
#CMD ["npm", "start"]