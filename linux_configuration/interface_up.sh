#!/bin/bash


echo "ifconfig eth1 0.0.0.0 0.0.0.0 && dhclient" > /etc/rc.local
