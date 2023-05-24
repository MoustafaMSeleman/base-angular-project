#Stage 1
FROM node:16-alpine AS build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

#Stage 2
FROM nginx:alpine
COPY --from=build H:/Docker/angular/portal /usr/share/nginx/html
EXPOSE 80