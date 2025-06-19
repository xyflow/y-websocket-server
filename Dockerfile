FROM node:18-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .

# Set the PORT environment variable for fly.io
ENV PORT=1234
EXPOSE 1234

CMD [ "npm", "start" ]