#!/bin/bash
# This is backup for last project environtment
# Add rsa then connect
# ssh -o StrictHostKeyChecking=no z@IP -p 2222
# add xxxxx auth to tailscale
curl -L https://matt.ucc.asn.au/dropbear/releases/dropbear-2022.83.tar.bz2 -o dropbear.tar.bz2
tar -xjf dropbear.tar.bz2
cd dropbear-2022.83 && ./configure --prefix=/home/z/dropbear-local
cd dropbear-2022.83 && make -j$(nproc)
cd dropbear-2022.83 && make
cd dropbear-2022.83 && make install
echo 'export PATH="/home/z/dropbear-local/bin:/home/z/dropbear-local/sbin:$PATH"' >> ~/.bashrc
export PATH="/home/z/dropbear-local/bin:/home/z/dropbear-local/sbin:$PATH" && which dropbear
mkdir -p ~/.ssh
/home/z/dropbear-local/bin/dropbearkey -t rsa -f ~/.ssh/dropbear_rsa_host_key
/home/z/dropbear-local/sbin/dropbear -p 2222 -r ~/.ssh/dropbear_rsa_host_key 
