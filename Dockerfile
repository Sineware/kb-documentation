FROM node:18
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM nginx
RUN mkdir -pv /usr/share/nginx/html/kb
COPY --from=0 /build /usr/share/nginx/html/kb