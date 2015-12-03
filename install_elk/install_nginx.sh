# install logstash-forwarder
yum install -y nginx httpd-tools
htpasswd -b -c /etc/nginx/htpasswd.users kibanaadmin kbnadmin123
yes | cp -rp nginx.conf /etc/nginx/
yes | cp -rp kibana.conf /etc/nginx/conf.d/
service nginx start
chkconfig nginx on
