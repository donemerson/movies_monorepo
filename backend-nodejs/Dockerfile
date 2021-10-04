FROM node:10.13

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json $HOME/

RUN chown -R app:app $HOME/*

USER root

WORKDIR $HOME

RUN npm i -g @adonisjs/cli

RUN npm install -g node-gyp

RUN npm install

EXPOSE 33060/tcp

EXPOSE 3333/tcp