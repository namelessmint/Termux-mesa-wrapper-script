#!/bin/bash

cd ~
pkg update && pkg upgrade -y
pkg install tur-repo x11-repo -y
sed -i '1s/$/ tur-multilib/' /data/data/com.termux/files/usr/etc/apt/sources.list.d/tur.list
pkg update && pkg upgrade -y
pkg install hangover termux-x11-* freetype git gnutls libandroid-shmem-static libx11 xorgproto libdrm libpixman libxfixes libjpeg-turbo mesa-demos osmesa pulseaudio termux-x11-nightly vulkan-tools xtrans libxxf86vm xorg-xrandr xorg-font-util xorg-util-macros libxfont2 libxkbfile libpciaccess xcb-util-renderutil xcb-util-image xcb-util-keysyms xcb-util-wm xorg-xkbcomp xkeyboard-config libxdamage libxinerama libxshmfence wget -y
wget https://github.com/alexvorxx/hangover-termux/releases/download/9.22/wine_hangover_9.22_bionic_build_patched.tar.xz
wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Arquivos/mesa.deb
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/test.sh
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/start.sh
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/update.sh
mkdir .update
mv update.sh .update.sh
mv start.sh .start.sh
mv wine_hangover_* wine_hangover.tar.xz
tar -xf wine_hangover.tar.xz
dpkg -i ./mesa.deb
rm wine_hangover.tar.xz
rm mesa.deb
echo "printf '\n Digite updatem para atualizar o mesa e win para iniciar o wine \n'" >> .bashrc
echo "alias win='~/.start.sh'" >> .bashrc
echo "alias updatem='~/.update.sh'" >> .bashrc
chmod +x .*.sh *.sh
clear
printf "complete installation, reboot termux\n"
