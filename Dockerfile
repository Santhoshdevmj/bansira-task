# Stage 1: Build
FROM node:14 AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production
FROM node:14-alpine AS production
WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
EXPOSE 3000
CMD [ "npm", "start" ]
