#!/bin/bash

#load last project

curl -L https://github.com/toprak1212/tmp/raw/refs/heads/main/openaiproxy.tar -o ~/temp.tar
tar -xvf ~/temp.tar
pkill -f bash
pkill -f npm
pkill -f node
node /home/z/my-project/node_modules/.bin/next dev -p 3000 > /dev/null 2>&1 &
