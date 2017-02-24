#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"
export PASSWORD="H3ll0W0rld!"

sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password $PASSWORD" 

sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ca.mirror.babylon.network/mariadb/repo/10.1/ubuntu xenial main'
sudo apt update
sudo apt install -y mariadb-server