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

mkdir .update .script /sdcard/Download/DXVK-3DTESTE/

wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/test.sh
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/start.sh
wget https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/update.sh
mv test.sh .script/.test.sh
echo "alias 3d-teste='~/.script/.test.sh'" >> .bashrc
mv update.sh .script/.update.sh
echo "alias update-mesa='~/.script/.update.sh'" >> .bashrc
mv start.sh .script/.start.sh
echo "alias pc-emu='~/.script/.start.sh'" >> .bashrc
chmod +x .script/.*.sh

wget https://github.com/alexvorxx/hangover-termux/releases/download/9.22/wine_hangover_9.22_bionic_build_patched.tar.xz
mv wine_hangover_* wine_hangover.tar.xz
tar -xf wine_hangover.tar.xz

wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/16%2F12/mesaup.deb
dpkg -i ./mesaup.deb

wget https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Arquivos3/script.zip
unzip script.zip -d /sdcard/Download/DXVK-3DTESTE/ -y

rm wine_hangover.tar.xz *.deb script.zip

echo "printf '\n Digite update-mesa para atualizar o mesa e pc-emu para iniciar o wine \n'" >> .bashrc

ln -s /sdcard/Download/ Downloads

clear
printf "Complete installation, reboot termux\n"
