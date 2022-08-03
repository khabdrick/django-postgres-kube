FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1
RUN mkdir /django-docker-okteto
WORKDIR /django-docker-okteto
COPY . .
RUN apk add --update postgresql-client jpeg-dev
RUN apk add --update --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install -r requirements.txt

EXPOSE 8000

RUN adduser -D user
USER user