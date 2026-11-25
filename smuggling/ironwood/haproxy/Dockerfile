FROM haproxy:2.0.5

RUN sed -i -e 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' \
         -e 's|deb.debian.org/debian-security|archive.debian.org/debian-security|g' \
         -e 's|deb.debian.org/debian|archive.debian.org/debian|g' /etc/apt/sources.list \
    && apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y curl

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg