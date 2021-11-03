#!/bin/bash

# ============================================
# Configure sandbox for quick workspace setup.
# ============================================

echo '== Install django =='
pip3 install django

echo '== Install mysql client =='
sudo apt-get install python3-dev build-essential -y
sudo apt-get install libmysqlclient-dev default-libmysqlclient-dev -y
pip3 install mysqlclient

echo '== Update system =='
sudo apt-get update

echo '== Apply unapplied migration(s) =='
python3 manage.py migrate
