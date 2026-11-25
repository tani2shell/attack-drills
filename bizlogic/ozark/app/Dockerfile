FROM python:3.8-slim

RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

RUN --mount=type=secret,id=flag sed -i "s|@FLAG@|$(cat /run/secrets/flag)|g" /app/app.py

WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]
