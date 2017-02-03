FROM node:5

WORKDIR /app

RUN apt-get update
RUN apt-get -y upgrade

ADD package.json /app/package.json
RUN npm install

ADD . /app
ENV NODE_ENV=production
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "prod"]
