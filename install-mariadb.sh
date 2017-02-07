#!/usr/bin/env bash


# add MariaDB repository key to DB
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

# update repository to include new package manifests
sudo apt-get update

# install MariaDB - Galera is included in MariaDB 10.1+
sudo apt-get install mariadb-server

# install rsync - needed later
sudo apt-get install rsync