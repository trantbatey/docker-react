FROM node:alpine as builder

RUN mkdir -p /app
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
