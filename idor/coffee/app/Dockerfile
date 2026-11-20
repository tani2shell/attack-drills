FROM node:21

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

ARG FLAG_B64
RUN printf %s "$FLAG_B64" | base64 -d > /app/.forgeflag && chmod 644 /app/.forgeflag
CMD ["node", "server.js"]
