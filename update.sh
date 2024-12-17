#!/bin/bash

cd ~/.update
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/mesa.sh
chmod +x mesa.sh
bash mesa.sh
clear
printf "mesa foi atualizado \n"
