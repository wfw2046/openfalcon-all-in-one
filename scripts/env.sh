#!/bin/bash
useradd -m work
useradd -m redis
mkdir /home/work/open-falcon/logs
yum -y install epel-release 
yum -y install python-pip 
pip install gunicorn 
pip install flask 
pip install requests 
yum -y install  redis 
yum -y install MySQL-python  
yum -y install  python-setuptools
easy_install supervisor
