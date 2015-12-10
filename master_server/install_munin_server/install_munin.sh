#!/bin/bash

yum update -y
yum install -y epel-release
file_path=/userdata/master_server/install_munin_server
yum install -y nginx httpd-tools
yum install -y munin munin-node rrdtool
yes | rm -rf /etc/nginx/conf.d/default.conf
yes | cp -rp $file_path/munin.conf /etc/nginx/conf.d/
service nginx restart
chkconfig nginx on
service munin-node restart
chkconfig munin-node on
