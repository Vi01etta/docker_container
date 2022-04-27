FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN pip3 install --upgrade pip
WORKDIR /usr/src/crud
COPY ./requirements.txt .
RUN apk update -q
RUN apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install -r requirements.txt
COPY . .

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]