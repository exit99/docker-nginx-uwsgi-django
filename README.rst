Docker-Nginx-Uwsgi-Django
=========================

A simple bare-bones docker image created while working at [Hivelocity](http://www.hivelocity.net).
This image contains configuration for basic **nginx**, **uwsgi**, and **django** setup.  It is built on **Alpine**.

Quick Start
===========

1. Clone the repo: `git clone REPO`.

2. Build the image: `docker build -t nginx-uwsgi-django .`.

3. Run the container: `docker run -p 80:80 -i -t nginx-uwsgi-django`.

4. Check out your site `curl $(docker-machine ip)`.


Python Version
==============

Defaults to `python3.5`.
You can change this line `FROM python:3.5-alpine` to `FROM python:2.7-apline` to use `python2.7` version.
Check the [official python repo](https://hub.docker.com/_/python/) for other python versions.  Note: Use the `apline` images.
