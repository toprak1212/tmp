#!/bin/bash
sudo apt-get install -y iputils-ping ufw dante-server
wget https://raw.githubusercontent.com/toprak1212/tmp/main/danted.txt
sudo cp -f danted.txt /etc/danted.conf
ping -c 3 127.0.0.1
sudo ufw allow 8081
ping -c 3 127.0.0.1
sudo /etc/init.d/danted start
ping -c 3 127.0.0.1

