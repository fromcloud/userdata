# install elasticsearch

yum update -y ca-certificates
yum install -y epel-release
file_path=/userdata/master_server/install_elk_server
yum install -y java-1.8.0-openjdk
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
cp -rf $file_path/elasticsearch.repo /etc/yum.repos.d/
yum install -y elasticsearch
cp -rf $file_path/elasticsearch.yml /etc/elasticsearch/
service elasticsearch start
chkconfig elasticsearch on
