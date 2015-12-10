#!/bin/bash 

file_path=/userdata/master_server/install_elk
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
yes | cp -rf $file_path/logstash-forwarder.repo /etc/yum.repos.d/
yum install -y logstash-forwarder
yes | cp -rf $file_path/logstash-forwarder.conf /etc/
vrip=$(cat /var/lib/dhclient/dhclient-eth0.leases | grep dhcp-server-identifier | tail -1 | awk '{print $3}' | tr -d ';')
myip=$(curl http://$vrip/latest/local-ipv4)
sed -i 's/server_ip/'"$myip"'/g' /etc/logstash-forwarder.conf
service logstash-forwarder start
chkconfig logstash-forwarder on
