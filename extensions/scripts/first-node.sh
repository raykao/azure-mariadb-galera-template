#!/usr/bin/env bash

sudo -i

cd /etc/mysql/conf.d

wget https://gist.githubusercontent.com/raykao/027e42847392a0eafb6c7b51c3291191/raw/a328e20eb13e2e129101dea460e1bd592d7f1c3b/galera.cnf

sed -i "s/first_ip/$(ip -4 addr ls eth0 | awk '/inet / {print $2}' | cut -d"/" -f1)/g" galera.cnf

sed -i "s/this_node_ip/$(ip -4 addr ls eth0 | awk '/inet / {print $2}' | cut -d"/" -f1)/g" galera.cnf

sed -i "s/this_node_name/$(hostname)/g" galera.cnf

systemctl stop mysql
sudo galera_new_cluster
