#!/bin/bash

file_path=/userdata/master_server/install_munin_server
yum upgrade -y ca-certificates
yum install -y epel-release
yum install -y nginx httpd-tools
yum install -y munin munin-node rrdtool
htpasswd -b -c /etc/nginx/munin-htpasswd.users muninadmin muninadmin123
yes | cp -rp $file_path/munin.conf /etc/nginx/conf.d/
service nginx restart
chkconfig nginx on
service munin-node restart
chkconfig munin-node on
