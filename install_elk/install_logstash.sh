# install logstash

yes | cp -rp logstash.repo /etc/yum.repos.d/
yum -y install logstash
yes | cp -rp openssl.cnf /etc/pki/tls/
sed -i 's/server_ip/$myip/g' /etc/pki/tls/openssl.cnf
cd /etc/pki/tls;openssl req -config /etc/pki/tls/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
yes | cp -rp 01-lumberjack-input.conf /etc/logstash/conf.d/
yes | cp -rp 10-syslog.conf /etc/logstash/conf.d/
yes | cp -rp 30-lumberjack-output.conf /etc/logstash/conf.d/
service logstash start
chkconfig logstash on
