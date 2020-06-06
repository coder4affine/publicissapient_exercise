FROM node:12-alpine 

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install && npm cache clean --force --loglevel=error

COPY --chown=node:node . .

EXPOSE 8080

RUN npm run build

CMD [ "npm", "run", "start"]