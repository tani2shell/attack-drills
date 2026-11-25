
FROM python:3.12

COPY . /app

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

RUN --mount=type=secret,id=flag sh -c 'sed s/FLAG/$(cat /run/secrets/flag)/g flag.seed > flag.txt'

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]