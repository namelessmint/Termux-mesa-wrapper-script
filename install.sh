#!/bin/bash


cp *.sh ~
cd ~
pkg update && pkg upgrade -y
pkg install tur-repo x11-repo -y
sed -i '1s/$/ tur-multilib/' /data/data/com.termux/files/usr/etc/apt/sources.list.d/tur.list
pkg update && pkg upgrade -y
pkg install hangover termux-x11-* -y
pkg install freetype git gnutls libandroid-shmem-static libx11 xorgproto libdrm libpixman libxfixes libjpeg-turbo mesa-demos osmesa pulseaudio termux-x11-nightly vulkan-tools xtrans libxxf86vm xorg-xrandr xorg-font-util xorg-util-macros libxfont2 libxkbfile libpciaccess xcb-util-renderutil xcb-util-image xcb-util-keysyms xcb-util-wm xorg-xkbcomp xkeyboard-config libxdamage libxinerama libxshmfence wget -y
wget https://github.com/alexvorxx/hangover-termux/releases/download/9.22/wine_hangover_9.22_bionic_build_patched.tar.xz
wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Arquivos/Mesa.atualizado.deb
tar -xf wine_hangover_9.22_bionic_build_patched.tar.xz
dpkg -i ./mesa.deb
rm wine_hangover_9.22_bionic_build_patched.tar.xz
rm Mesa.atualizado.deb
clear
printf "complete installation \n"
