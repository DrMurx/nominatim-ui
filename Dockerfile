FROM node:14-alpine AS builder
WORKDIR /app
COPY . /app
RUN yarn install && yarn build

FROM nginx:latest
COPY --from=builder /app/dist/ /usr/share/nginx/html
