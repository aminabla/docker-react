#first image. builds a single html file
FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# image build using previous html that will be served by the nginx server
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

