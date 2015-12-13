#!/bin/bash

yum update -y ca-certificates
yum install -y epel-release
file_path=/userdata/master_server/install_salt_master
yum install -y salt salt-api salt-cloud salt-master salt-minion
yes | cp -p $file_path/master /etc/salt/
yes | mkdir -p /salt/states/base /salt/states/dev /salt/pillars/base
chkconfig salt-master on
service salt-master restart

yes | cp -rp $file_path/minion /etc/salt/
vrip=$(cat /var/lib/dhclient/dhclient-eth0.leases | grep dhcp-server-identifier | tail -1 | awk '{print $3}' | tr -d ';')
myip=$(curl http://$vrip/latest/local-ipv4)
sed -i 's/server_ip/'"$myip"'/g' /etc/salt/minion
chkconfig salt-minion on
service salt-minion restart
