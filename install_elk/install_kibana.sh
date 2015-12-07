#!/bin/bash

echo 0 >/selinux/enforce
groupadd -g 1005 kibana
useradd -u 1005 -g 1005 kibana
wget -N -P /tmp/ https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz
tar xvf /tmp/kibana-*.tar.gz
mv /tmp/kibana-* /opt/kibana
yes | cp -rf /userdata/install_elk/kibana.yml /opt/kibana/config/
chown -R kibana: /opt/kibana
cd /etc/init.d && sudo curl -o kibana https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-init
cd /etc/default && sudo curl -o kibana https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-default
service kibana start
chkconfig kibana on
