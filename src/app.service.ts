import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello caralho!';
  }
}

/*
node instalado

yarn || npm install //Instalar dependencias

yarn run build || npm run build //buildar o projeto

yarn run start || npm run start //rodar o projeto
*/
