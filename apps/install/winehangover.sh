#!/bin/bash

clear

pkg install hangover winetricks cabextract -y
mkdir /sdcard/Download/DXVK-3DTESTE/
clear

echo "Baixando a Wine Hangover"
wget -q https://github.com/alexvorxx/hangover-termux/releases/download/9.22/wine_hangover_9.22_bionic_build_patched.tar.xz
mv wine_hangover_* wine_hangover.tar.xz
echo "Extraindo a Wine Hangover"
tar -xf wine_hangover.tar.xz
WINEPREFIX=~/.wine64
winetricks dxvk
clear

echo "Baixando Arquivos Adicionais"
wget -q https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Arquivos3/script.zip
echo "Extraindo Arquivos para Downloads"
unzip -oq script.zip -d /sdcard/Download/DXVK-3DTESTE/
clear

echo "Limpamdo arquivos temporarios"
rm  wine_hangover.tar.xz  script.zip

echo "Baixando e configurando script Adicional"
wget -q -O .script/wine.sh https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/apps/start/wine.sh
echo "alias pc-emu='~/.script/wine.sh'" >> .bashrc
chmod +x .script/wine.sh

echo "printf '\n Use o comando pc-emu para iniciar o Wine. \n'" >> .bashrc

clear
