# install logstash-forwarder
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
yes | cp -rf logstash-forwarder.repo /etc/yum.repos.d/
yum -y install logstash-forwarder
yes | cp -rf logstash-forwarder.conf /etc/
sed -i 's/server_ip/$myip/g' /etc/logstash-forwarder.conf
service logstash-forwarder start
chkconfig logstash-forwarder on
