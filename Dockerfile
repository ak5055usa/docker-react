# Build phase
FROM node:21-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

# Run phase
FROM nginx:1.25.4-alpine
# Expose useful for elastic beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html