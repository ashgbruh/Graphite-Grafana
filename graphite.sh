#!/bin/bash

#Graphite consists of three separate application, Carbon, Whisper and Graphite Web.
#Install build dependencies which are required to compile a few Graphite components by running.

sudo apt -y install python-dev python-pip libcairo2-dev libffi-dev build-essential

#Install Graphite along with all its components by running.

export PYTHONPATH="/opt/graphite/lib/:/opt/graphite/webapp/"
sudo -H pip install --no-binary=:all: https://github.com/graphite-project/whisper/tarball/master
sudo -H pip install --no-binary=:all: https://github.com/graphite-project/carbon/tarball/master
sudo -H pip install --no-binary=:all: https://github.com/graphite-project/graphite-web/tarball/master

#Create an initial schema for Graphite by running the command.

sudo -H PYTHONPATH=/opt/graphite/webapp django-admin.py migrate --settings=graphite.settings --run-syncdb

#Create superuser for Graphite by running the following command. You will need to provide a username, password, and email for this.
sudo -H PYTHONPATH=/opt/graphite/webapp django-admin.py createsuperuser --settings=graphite.settings

#Generate a static file for Graphite web app by running the command.

sudo -H PYTHONPATH=/opt/graphite/webapp django-admin.py collectstatic --noinput --settings=graphite.settings

#Finally, copy carbon configuration files by running.
sudo cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf
sudo cp /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf

