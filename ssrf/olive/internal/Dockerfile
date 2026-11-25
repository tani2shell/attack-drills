FROM php:7.4-apache

COPY . /var/www/html/

EXPOSE 80

RUN { echo "deb http://archive.debian.org/debian bullseye main"; echo "deb http://archive.debian.org/debian bullseye-updates main"; } > /etc/apt/sources.list && apt-get -o Acquire::Check-Valid-Until=false update -y

RUN apt-get install -y curl

RUN --mount=type=secret,id=flag sed -i "s|<FLAG>|$(cat /run/secrets/flag)|g" /var/www/html/index.php
