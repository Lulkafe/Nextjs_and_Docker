FROM node:lts-alpine
WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json", "./"]
RUN npm install --production --silent && mv node_modules ../

COPY . .
RUN npx next build

EXPOSE 8080

CMD ["npx", "next", "start", "-p", "${PORT}"]