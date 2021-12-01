FROM node:16 as builder

RUN mkdir -p /app
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
