# @so-ric/colorspace 传递依赖用 ||= 语法(Node15+),node14 SyntaxError 重启循环;基座升 node:20-alpine(坑账 b10 先例)。
# (前 patch 换 alpine archive 域系误判已回退:alpine 老版仓库仍在 dl-cdn 供档)
FROM node:20-alpine
RUN apk --no-cache add curl
WORKDIR /app
COPY . .
RUN npm install 
EXPOSE 8333
CMD [ "npm", "start" ]
