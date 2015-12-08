#!/bin/bash 

rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
yes | cp -rf /userdata/install_elk/logstash-forwarder.repo /etc/yum.repos.d/
yum -y install logstash-forwarder
yes | cp -rf /userdata/install_elk/logstash-forwarder.conf /etc/
vrip=$(curl /var/lib/dhclient/dhclient-eth0.leases | grep dhcp-server-identifier | tail -1 | awk '{print $3}' | tr -d ';')
myip=$(curl http://$vrip/latest/local-ipv4)
sed -i 's/server_ip/$myip/g' /etc/logstash-forwarder.conf
service logstash-forwarder start
chkconfig logstash-forwarder on
