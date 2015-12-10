#!/bin/bash

file_path=/userdata/master_server/install_elk_server
yum install -y nginx httpd-tools
htpasswd -b -c /etc/nginx/htpasswd.users kibanaadmin kibanadmin123
yes | cp -rp $file_path/nginx.conf /etc/nginx/
yes | cp -rp $file_path/kibana.conf /etc/nginx/conf.d/
service nginx start
chkconfig nginx on
