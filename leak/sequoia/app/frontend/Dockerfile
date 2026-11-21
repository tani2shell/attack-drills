FROM node:20-alpine

RUN apk --no-cache add curl

WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build
EXPOSE 3000
RUN --mount=type=secret,id=flag sh -c 'sed -i "s|@FLAG@|$(cat /run/secrets/flag)|g" .env'

CMD ["npm", "start"]