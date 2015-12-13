#!/bin/bash

file_path=/userdata/master_server/install_elk_server
yum install -y nginx httpd-tools
yes | cp -rp $file_path/nginx.conf /etc/nginx/
yes | cp -rp $file_path/kibana.conf /etc/nginx/conf.d/
htpasswd -b -c /etc/nginx/htpasswd.users kbn kbn
rm -rf /etc/nginx/conf.d/default.conf
service nginx start
chkconfig nginx on
