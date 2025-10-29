FROM python:3.12-alpine
LABEL authors="github@amlor.at"

WORKDIR /app

RUN ["apk", "add", "bash", "make"]
RUN ["python3", "-m", "venv", "venv"]
RUN ["bash", "-c", "source venv/bin/activate"]
RUN ["pip", "install", "--upgrade", "pip"]
COPY requirements.txt .
RUN ["pip", "install", "-r", "requirements.txt"]
RUN ["ln", "-s", "./data/mesh.ini"]
COPY ./ /app

ENTRYPOINT ["make", "run"]
