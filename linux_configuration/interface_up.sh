#!/bin/bash

ifcfg eth1 0.0.0.0 0.0.0.0 && dhclient
echo "ifconfig eth1 0.0.0.0 0.0.0.0 && dhclient" > /etc/rc.local
