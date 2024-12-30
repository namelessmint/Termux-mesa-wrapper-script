#!/bin/bash

if [ ! -d /data/data/com.termux/files/home/storage ]; then
    echo "Por favor, configure o armazenamento usando 'termux-setup-storage' antes de executar este script."
    exit 1
fi

cd ~
pkg update && pkg upgrade -y
pkg install tur-repo x11-repo -y
sed -i '1s/$/ tur-multilib/' /data/data/com.termux/files/usr/etc/apt/sources.list.d/tur.list
pkg update && pkg upgrade -y
pkg install termux-x11-* termux-api freetype git gnutls libandroid-shmem-static libx11 xorgproto libdrm libpixman libxfixes libjpeg-turbo mesa-demos osmesa mesa pulseaudio termux-x11-nightly vulkan-tools xtrans libxxf86vm xorg-xrandr xorg-font-util xorg-util-macros libxfont2 libxkbfile libpciaccess xcb-util-renderutil xcb-util-image xcb-util-keysyms xcb-util-wm xorg-xkbcomp xkeyboard-config libxdamage libxinerama libxshmfence wget -y
mkdir .install .update .script
clear

echo "Baixando e configurando scripts Adicionais"
wget -q https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/test.sh
mv test.sh .script/.test.sh
echo "alias 3d-teste='~/.script/.test.sh'" >> .bashrc
echo "alias mesa-update='bash <(curl -s https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/update.sh)'" >> .bashrc
chmod +x .script/.*.sh

echo "Instalando o Mesa"
wget -q https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/16%2F12/mesaup.deb -O .install/mesa.deb
dpkg -i ./.install/*.deb
clear

echo "Limpamdo arquivos temporarios"
rm -r .install/

echo "printf '\n Use o comando mesa-update para atualizar o Mesa. \n'" >> .bashrc

ln -s /sdcard/Download/ Downloads

bash <(curl -s https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/winehangover.sh)

clear
printf "Instalação Concluída, Reinicie o Termux para continuar\n"
