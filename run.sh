#!/bin/bash
sudo apt-get install -y iputils-ping ufw dante-server
wget https://raw.githubusercontent.com/toprak1212/tmp/main/danted.txt
sudo cp -f danted.txt /etc/danted.conf
sudo ufw allow 8081
sudo /etc/init.d/danted start
ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 35081:localhost:8081 serveo.net

