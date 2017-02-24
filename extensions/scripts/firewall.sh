#!/usr/bin/env bash

sudo ufw allow ssh
sudo ufw allow 3306,4567,4568,4444/tcp
sudo ufw allow 4567/udp
sudo ufw enable