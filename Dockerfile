# Stage 1: Build
FROM node:18 AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production
FROM node:18-alpine AS production
WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
EXPOSE 3000
CMD [ "npm", "start" ]
