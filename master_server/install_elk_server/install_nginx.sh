#!/bin/bash

file_path=/userdata/master_server/install_elk
yum install -y nginx httpd-tools
htpasswd -b -c /etc/nginx/kibana-htpasswd.users kibanaadmin kbnadmin123
yes | cp -rp $file_path/nginx.conf /etc/nginx/
yes | cp -rp $file_path/kibana.conf /etc/nginx/conf.d/
service nginx start
chkconfig nginx on
