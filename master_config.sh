#/bin/sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
add-apt-repository "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main"
apt-get update -y
apt-get upgrade -y
apt-get install -y apt-transport-https ca-certificates curl software-properties-common git
apt-get install -y apache2 munin rsyslog docker-ce salt-master
git clone https://github.com/Koetjh/musical-disco
cp -rf /musical-disco/munin.conf /etc/munin/
cp -rf /musical-disco/apache24.conf /etc/munin/
cp -rf /musical-disco/rsyslog.conf /etc/
cp -rf /musical-disco/master /etc/salt/
mkdir /srv/salt/
cp -rf /musical-disco/base.sls /srv/salt/
mkdir /var/www/munin
chown munin:munin /var/www/munin

systemctl restart rsyslog
systemctl restart munin-node
systemctl restart apache2
systemctl restart salt-master
