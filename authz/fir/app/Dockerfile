
FROM python:3.8-slim-buster

WORKDIR /app

RUN sed -i 's|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /buster-updates/d' /etc/apt/sources.list && apt-get update
RUN apt-get install -y curl

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY app.py app.py
COPY templates/ templates/


CMD ["sh", "-c", "FLAG=$(cat /run/secrets/flag) exec python3 app.py"]
