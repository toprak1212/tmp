#!/usr/bin/env bash

#wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
ls
touch /etc/apt/apt.conf.d/99verify-peer.conf 
echo "Acquire { https::Verify-Peer false }" >>/etc/apt/apt.conf.d/99verify-peer.conf 

echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy main restricted" > /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-updates main restricted" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy universe" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-updates universe" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy multiverse" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-updates multiverse" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-security main restricted" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-security universe" >> /etc/apt/sources.list
echo "deb https://mirror.poliwangi.ac.id/ubuntu/ jammy-security multiverse" >> /etc/apt/sources.list
