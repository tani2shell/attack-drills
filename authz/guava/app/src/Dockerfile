FROM php:5-apache

COPY . . 
WORKDIR /var/www/html

RUN --mount=type=secret,id=flag sh -c 'sed -i "s/@FLAG@/$(cat /run/secrets/flag)/g" index.php'

EXPOSE 80
