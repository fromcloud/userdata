# install elasticsearch
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
yes | cp -rf elasticsearch.repo /etc/yum.repos.d/
yum -y install elasticsearch
yes | cp -rf elasticsearch.yml /etc/elasticsearch/
service elasticsearch start
chkconfig elasticsearch on
