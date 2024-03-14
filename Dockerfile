FROM node:21-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.25.4-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html