FROM python:3.5-alpine

MAINTAINER "Hivelocity"
LABEL project="www.hivelocity.net"
LABEL version = "0.0.0"
LABEL author="Zach Kazanski"
LABEL author_email="kazanski.zachary@gmail.com"

RUN apk add --update \
    nginx \
    supervisor \ 
    python-dev \
    build-base \
    linux-headers \
    pcre-dev \
    py-pip \ 
    vim \
  && rm -rf /var/cache/apk/* && \
  chown -R nginx:www-data /var/lib/nginx

RUN pip install https://github.com/unbit/uwsgi/archive/uwsgi-2.0.zip#egg=uwsgi
RUN pip install django

ADD . /app
WORKDIR /app

RUN mkdir /etc/nginx/sites-enabled
RUN rm /etc/nginx/nginx.conf
RUN ln -s /app/nginx.conf /etc/nginx/
RUN ln -s /app/nginx-app.conf /etc/nginx/sites-enabled/
RUN rm /etc/supervisord.conf
RUN ln -s /app/supervisord.conf /etc/

EXPOSE 80

CMD ["supervisord", "-n"]
