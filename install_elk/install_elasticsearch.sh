# install elasticsearch

yum update -y
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
yes | cp -rf /userdata/install_elk/elasticsearch.repo /etc/yum.repos.d/
yum install -y elasticsearch
yes | cp -rf //userdata/install_elk/elasticsearch.yml /etc/elasticsearch/
service elasticsearch start
chkconfig elasticsearch on
