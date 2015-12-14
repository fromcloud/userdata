#!/bin/bash

yum update -y ca-certificates
yum install -y epel-release
file_path=/userdata/master_server/install_munin_server
yum install -y nginx httpd-tools
yum install -y munin munin-node rrdtool
rm -rf /etc/nginx/conf.d/default.conf
cp -rp $file_path/nginx.conf /etc/nginx/
cp -rp $file_path/munin-web.conf /etc/nginx/conf.d/
cp -rp $file_path/munin.conf /etc/munin/
htpasswd -b /etc/nginx/htpasswd.users mn mn
service nginx restart
chkconfig nginx on
service munin-node restart
chkconfig munin-node on
