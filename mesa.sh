#!/bin/bash

wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/16%2F12/mesaup.deb
apt install ./*.deb -y
rm *.deb
rm *.sh
