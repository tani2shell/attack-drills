FROM php:7.4-apache

COPY . /var/www/html/

RUN { echo "deb http://archive.debian.org/debian bullseye main"; echo "deb http://archive.debian.org/debian bullseye-updates main"; } > /etc/apt/sources.list && apt-get -o Acquire::Check-Valid-Until=false update -y

RUN apt-get install -y curl libcurl4-openssl-dev pkg-config

RUN docker-php-ext-install curl

EXPOSE 80
