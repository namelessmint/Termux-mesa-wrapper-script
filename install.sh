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
pkg install hangover termux-x11-* freetype git gnutls libandroid-shmem-static libx11 xorgproto libdrm libpixman libxfixes libjpeg-turbo mesa-demos osmesa pulseaudio termux-x11-nightly vulkan-tools xtrans libxxf86vm xorg-xrandr xorg-font-util xorg-util-macros libxfont2 libxkbfile libpciaccess xcb-util-renderutil xcb-util-image xcb-util-keysyms xcb-util-wm xorg-xkbcomp xkeyboard-config libxdamage libxinerama libxshmfence wget -y
wget https://github.com/alexvorxx/hangover-termux/releases/download/9.22/wine_hangover_9.22_bionic_build_patched.tar.xz
wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Arquivos/mesa.deb
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/test.sh
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/start.sh
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/update.sh
wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Arquivos3/script.zip
mkdir .update .script /sdcard/Download/scriptDown/
mv update.sh .script/.update.sh
mv start.sh .script/.start.sh
mv wine_hangover_* wine_hangover.tar.xz
tar -xf wine_hangover.tar.xz
dpkg -i ./mesa.deb
unzip script.zip -d /sdcard/Download/scriptDown/
rm wine_hangover.tar.xz mesa.deb script.zip
echo "printf '\n Digite update-mesa para atualizar o mesa e win para iniciar o wine \n'" >> .bashrc
echo "alias win='~/.script/.start.sh'" >> .bashrc
echo "alias update-mesa='~/.script/.update.sh'" >> .bashrc
chmod +x .script/.*.sh *.sh
clear
printf "complete installation, reboot termux\n"
