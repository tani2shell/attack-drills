FROM debian:bullseye-slim

RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list
RUN apt-get update && apt-get install -y apache2 \
    libapache2-mod-wsgi-py3 \
    python3 \
    python3-pip \
    curl \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY ./website/requirements.txt /var/www/deserialization_pickle_bookmarks/app/requirements.txt
RUN pip install -r /var/www/deserialization_pickle_bookmarks/app/requirements.txt

COPY ./deserialization_pickle_bookmarks-httpd.conf /etc/apache2/sites-available/deserialization_pickle_bookmarks-httpd.conf
COPY ./website/deserialization_pickle_bookmarks.wsgi /var/www/deserialization_pickle_bookmarks/
COPY ./website/run.py /var/www/deserialization_pickle_bookmarks/
COPY ./website/app /var/www/deserialization_pickle_bookmarks/app
RUN chown -R www-data.www-data /var/www/deserialization_pickle_bookmarks/app/

RUN --mount=type=secret,id=flag sh -c 'mkdir -p /opt && cat /run/secrets/flag > /opt/labflag && chmod 644 /opt/labflag'
RUN a2dissite 000-default.conf
RUN a2ensite deserialization_pickle_bookmarks-httpd.conf
RUN a2enmod headers

CMD  /usr/sbin/apache2ctl -D FOREGROUND