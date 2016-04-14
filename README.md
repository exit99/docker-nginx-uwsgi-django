Docker-Nginx-Uwsgi-Django
=========================

A simple bare-bones docker image created while working at [Hivelocity](http://www.hivelocity.net).
This image contains configuration for basic **nginx**, **uwsgi**, and **django** setup.  It is built on **Alpine**.


Quick Start
===========

1. Clone the repo: `git clone https://github.com/Kazanz/docker-nginx-uwsgi-django.git`.

2. Build the image: `docker build -t nginx-uwsgi-django .`.

3. Run the container: `docker run -p 80:80 nginx-uwsgi-django`.

4. Check out your site `curl $(docker-machine ip)`.


## Adding your own Django Application

1. Remove the initial django project: `rm -r project`.

2. Create your own django project: `django-admin.py startproject myproject`. 

3. Update `uwsgi/uwsgi.ini` to point at your new project: `sed -i '' 's/project/myproject/g' uwsgi/uwsgi.ini`.


## Installing from a Requirements File

1. Place a `reqs.txt` file in the main directory.

2. Install the requirements via the `Dockerfile`: `sed -i '' 's/pip install django/pip install -r \/app\/reqs.txt/g' Dockerfile`.


## Python Version

Defaults to `python3.5`.
You can change this line `FROM python:3.5-alpine` to `FROM python:2.7-apline` in the `Dockerfile` to use `python2.7` version.

Check the [official python repo](https://hub.docker.com/_/python/) for other python versions.  Use the `apline` images.
