FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN --mount=type=secret,id=flag sh -c 'cat /run/secrets/flag > /flag.txt && chmod 644 /flag.txt'

EXPOSE 5000

CMD ["python", "app.py"]

