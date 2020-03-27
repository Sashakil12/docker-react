#Build phase
FROM node:alpine as builder
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#Run phrase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
CMD ["nginx" ,"-g", "daemon off;"]
