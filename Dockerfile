# build ===============================
FROM node:14 as build

WORKDIR /shit

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# run ===============================
FROM node:14-alpine as run

WORKDIR /shit

COPY --from=build /shit .

EXPOSE 3000

CMD ["npm", "run", "start:prod"]
