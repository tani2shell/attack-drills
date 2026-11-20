FROM php:5-apache

COPY . . 
WORKDIR /var/www/html


ARG FLAG_B64
RUN sh -c 'F=$(printf %s "$FLAG_B64" | base64 -d) && sed -i "s/@FLAG@/$F/g" index.php'

EXPOSE 80
