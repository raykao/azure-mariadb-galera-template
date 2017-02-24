#!/usr/bin/env bash
# first argument passed in should be the ip Address of the master/galera cluster node already active

sudo -i

cd /etc/mysql/conf.d

# download the baseic galera configuration file
wget https://gist.githubusercontent.com/raykao/027e42847392a0eafb6c7b51c3291191/raw/a328e20eb13e2e129101dea460e1bd592d7f1c3b/galera.cnf

# update galera file with relevant info
# include the master/active node info
sed -i "s/first_ip/$1/g" galera.cnf

# update the current nodes' information
sed -i "s/this_node_ip/$(ip -4 addr ls eth0 | awk '/inet / {print $2}' | cut -d"/" -f1)/g" galera.cnf

sed -i "s/this_node_name/$(hostname)/g" galera.cnf

systemctl stop mysql
systemctl start mysql