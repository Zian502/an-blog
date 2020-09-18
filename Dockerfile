FROM node:lts-alpine as build-stage
 
COPY ./public /app/
 
WORKDIR /app
 
FROM nginx:stable-alpine as production-stage
 
MAINTAINER yuanzhian
 
COPY --from=build-stage /app /usr/share/nginx/html
 
RUN chown -R nginx:nginx /usr/share/nginx/html
 
EXPOSE 80