#!/bin/bash

r=$(dpkg -l | grep lazarus)

if [ -z "$r" ]; then
echo "installing build compiler and depency ..."
sudo apt install lazarus -y
fi

lazbuild -B transgui.lpi

r=$(dpkg -l | grep ' zip')
if [ -z "$r" ]; then
echo "installing zip package ..."
sudo apt install zip -y
fi

echo "make zip package ..."

make zipdist
