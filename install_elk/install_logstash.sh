#!/bin/bash

yes | cp -rp /userdata/install_elk/logstash.repo /etc/yum.repos.d/
yum install -y logstash
yes | cp -rp /userdata/install_elk/openssl.cnf /etc/pki/tls/
vrip=$(cat /var/lib/dhclient/dhclient-eth0.leases | grep dhcp-server-identifier | tail -1 | awk '{print $3}' | tr -d ';')
myip=$(curl http://$vrip/latest/local-ipv4)
sed -i 's/server_ip/$myip/g' /etc/pki/tls/openssl.cnf
cd /etc/pki/tls;openssl req -config /etc/pki/tls/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
yes | cp -rp /userdata/install_elk/01-lumberjack-input.conf /etc/logstash/conf.d/
yes | cp -rp /userdata/install_elk/10-syslog.conf /etc/logstash/conf.d/
yes | cp -rp /userdata/install_elk/30-lumberjack-output.conf /etc/logstash/conf.d/
service logstash start
chkconfig logstash on
