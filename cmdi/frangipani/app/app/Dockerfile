
FROM python:3.8-slim-buster

WORKDIR /app

RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list
RUN apt-get update --allow-releaseinfo-change && apt-get install -y curl

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN --mount=type=secret,id=flag sh -c 'cat /run/secrets/flag > /app/.forgeflag && chmod 644 /app/.forgeflag'

CMD ["python", "app.py"]