vrip=$(cat /var/lib/dhclient/dhclient-eth0.leases | grep dhcp-server-identifier | tail -1 | awk '{print $3}' | tr -d ';')
for meta in service-offering availability-zone local-ipv4 local-hostname public-ipv4 public-hostname instance-id
do
	curl http://$vrip/latest/$meta
	echo
done
