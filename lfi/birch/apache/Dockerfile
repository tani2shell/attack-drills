FROM httpd:2.4.49
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

# lab-patch: buster (httpd:2.4.49 base) is EOL, apt sources moved to archive.debian.org
RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /buster-updates/d' /etc/apt/sources.list && apt-get update

RUN apt-get install -y curl

ARG FLAG
RUN echo $FLAG > /tmp/flag
