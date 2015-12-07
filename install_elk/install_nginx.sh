#!/bin/bash

yum install -y nginx httpd-tools
htpasswd -b -c /etc/nginx/htpasswd.users kibanaadmin kbnadmin123
yes | cp -rp /userdata/install_elk/nginx.conf /etc/nginx/
yes | cp -rp /userdata/install_elk/kibana.conf /etc/nginx/conf.d/
service nginx start
chkconfig nginx on
