FROM debian:bullseye-slim


RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list

RUN apt-get update --allow-releaseinfo-change && apt-get install -y python3 \
    python3-pip \
    curl \
    python3-dev \
    default-libmysqlclient-dev \
    pkg-config \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/templates
COPY ./ssti_secret_art_gallery /app
COPY ./templates /app/templates
COPY ./wait-for-it.sh /app
RUN chmod +x /app/wait-for-it.sh
RUN pip install -r /app/requirements.txt


ARG FLAG_B64
RUN sh -c 'printf %s "$FLAG_B64" | base64 -d > /flag.txt && chmod 644 /flag.txt'

WORKDIR /app/

CMD ["./wait-for-it.sh", "db:3306", "--", "sh", "-c", "python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:80"]