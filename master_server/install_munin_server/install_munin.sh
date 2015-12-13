#!/bin/bash

yum update -y ca-certificates
yum install -y epel-release
file_path=/userdata/master_server/install_munin_server
yum install -y nginx httpd-tools
yum install -y munin munin-node rrdtool
yes | rm -rf /etc/nginx/conf.d/default.conf
yes | cp -rp $file_path/nginx.conf /etc/nginx/
yes | cp -rp $file_path/munin-web.conf /etc/nginx/conf.d/
yes | cp -rp $file_path/munin.conf /etc/munin/
htpasswd -b -c /var/www/munin-htpasswd mn mn
service nginx restart
chkconfig nginx on
service munin-node restart
chkconfig munin-node on
