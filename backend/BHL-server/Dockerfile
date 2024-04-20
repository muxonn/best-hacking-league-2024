FROM python:3.11

COPY requirements.txt /app/

EXPOSE 8000

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./src/ /app/src/

ENTRYPOINT python -m uvicorn src.main:app --host 0.0.0.0 --port 8000
