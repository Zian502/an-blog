FROM node:lts-alpine as build-stage
 
COPY . /app/
 
WORKDIR /app
 
RUN npm i && npm run build
 
FROM nginx:stable-alpine as production-stage
 
MAINTAINER yuanzhian
 
COPY --from=build-stage /app/public/ /usr/share/nginx/html
 
RUN chown -R nginx:nginx /usr/share/nginx/html
 
EXPOSE 80