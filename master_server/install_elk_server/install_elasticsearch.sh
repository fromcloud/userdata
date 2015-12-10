# install elasticsearch

file_path=/userdata/install_elk
yum update -y
yum install -y java-1.8.0-openjdk
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
yes | cp -rf $file_path/elasticsearch.repo /etc/yum.repos.d/
yum install -y elasticsearch
yes | cp -rf $file_path/elasticsearch.yml /etc/elasticsearch/
service elasticsearch start
chkconfig elasticsearch on
