FROM python:3.8-slim

RUN apt-get update --allow-releaseinfo-change \
    && apt-get install -y --no-install-recommends iputils-ping curl procps\
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app


ARG FLAG_B64
RUN sh -c 'printf %s "$FLAG_B64" | base64 -d > /flag.txt && chmod 644 /flag.txt'

WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]
