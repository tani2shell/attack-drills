
FROM python:3.8-slim-buster

WORKDIR /app


RUN sed -i 's|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g' /etc/apt/sources.list

RUN apt-get update -o Acquire::Check-Valid-Until=false && apt-get install -y curl

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .


ARG FLAG_B64
RUN sh -c 'printf %s "$FLAG_B64" | base64 -d > /app/.forgeflag && chmod 644 /app/.forgeflag'

CMD ["python", "app.py"]