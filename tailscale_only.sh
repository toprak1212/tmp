#!/bin/bash
# This is backup for last project environtment


mkdir -p ~/tailscale && cd ~/tailscale
cd ~/tailscale && wget https://pkgs.tailscale.com/stable/tailscale_1.74.1_amd64.tgz
cd ~/tailscale && tar -xzf tailscale_1.74.1_amd64.tgz
cp ~/tailscale/tailscale_1.74.1_amd64/tailscale ~/tailscale/ && cp ~/tailscale/tailscale_1.74.1_amd64/tailscaled ~/tailscale/
mkdir -p ~/tailscale-sock
~/tailscale/tailscaled --tun=userspace-networking --socket=/home/z/tailscale-sock/tailscaled.sock --state=/home/z/tailscale-sock/tailscaled.state &
