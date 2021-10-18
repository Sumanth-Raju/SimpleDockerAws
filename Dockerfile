FROM node:alpine as builder

WORKDIR '/app'
COPY package*.json ./

RUN npm install
COPY ./ ./

RUN npm run build # this will create a build folder inside the container

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
