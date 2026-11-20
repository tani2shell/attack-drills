FROM python:3.8-slim

RUN if [ -f /etc/apt/sources.list ]; then sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list; fi
RUN apt-get update --allow-releaseinfo-change \
    && apt-get install -y --no-install-recommends iputils-ping curl\
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

RUN --mount=type=secret,id=flag sh -c 'cat /run/secrets/flag > /FLAG.txt && chmod 644 /FLAG.txt'

WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]
