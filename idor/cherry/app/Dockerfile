FROM debian:bullseye-slim


RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list
RUN apt-get update --allow-releaseinfo-change && apt-get install -y apache2 \
    libapache2-mod-wsgi-py3 \
    python3 \
    python3-pip \
    curl \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY ./website/requirements.txt /var/www/idor_broken_authn_trading_platform/app/requirements.txt
RUN pip install -r /var/www/idor_broken_authn_trading_platform/app/requirements.txt

COPY ./idor_broken_authn_trading_platform-httpd.conf /etc/apache2/sites-available/idor_broken_authn_trading_platform-httpd.conf
COPY ./website/idor_broken_authn_trading_platform.wsgi /var/www/idor_broken_authn_trading_platform/
COPY ./website/run.py /var/www/idor_broken_authn_trading_platform/
COPY ./website/app /var/www/idor_broken_authn_trading_platform/app


ARG FLAG_B64
RUN sh -c 'printf %s "$FLAG_B64" | base64 -d > /flag && chmod 644 /flag'

RUN a2dissite 000-default.conf
RUN a2ensite idor_broken_authn_trading_platform-httpd.conf
RUN a2enmod headers

CMD  /usr/sbin/apache2ctl -D FOREGROUND