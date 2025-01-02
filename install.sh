#!/bin/bash

if [ ! -d /data/data/com.termux/files/home/storage ]; then
    echo "Por favor, configure o armazenamento usando 'termux-setup-storage' antes de executar este script."
    exit 1
fi

cd ~
pkg update && pkg upgrade -y
clear
echo "Instalando Pacotes adicionais..."
pkg install tur-repo x11-repo -y &> /dev/null
sed -i '1s/$/ tur-multilib/' /data/data/com.termux/files/usr/etc/apt/sources.list.d/tur.list &> /dev/null
pkg update && pkg upgrade -y
pkg install termux-x11-* termux-api freetype git gnutls libandroid-shmem-static libx11 xorgproto libdrm libpixman libxfixes libjpeg-turbo mesa-demos osmesa mesa pulseaudio termux-x11-nightly vulkan-tools xtrans libxxf86vm xorg-xrandr xorg-font-util xorg-util-macros libxfont2 libxkbfile libpciaccess xcb-util-renderutil xcb-util-image xcb-util-keysyms xcb-util-wm xorg-xkbcomp xkeyboard-config libxdamage libxinerama libxshmfence wget -y
mkdir .install .update .script

echo "Baixando e configurando scripts Adicionais..."
wget -q https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/aux/test.sh
mv test.sh .script/.test.sh
echo "alias 3d-teste='~/.script/.test.sh'" >> .bashrc
echo "alias mesa-update='bash <(curl -s https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/aux/update.sh)'" >> .bashrc
chmod +x .script/.*.sh
clear

echo "printf '\n Use o comando mesa-update para atualizar o Mesa.'" >> .bashrc

ln -s /sdcard/Download/ Downloads

install_winehangover() {
    echo "Instalando Wine Hangover..."
    bash <(curl -s https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/apps/install/winehangover.sh)
    echo "Wine Hangover instalado com sucesso!"
}

install_rpcs3() {
    echo "Instalando RPCS3..."
    wget -q -O .install/install https://github.com/daviDarthemis/acclan/releases/download/000.01.10/install
    chmod +x .install/install
    .install/install
    echo " printf 'Digite olympus para iniciar o RPCS3. \n'" >> .bashrc
    echo "RPCS3 instalado com sucesso!"
}

install_xemu() {
    echo "Instalando XEMU..."
    wget -q -O .install/xemu-arm64.deb "https://github.com/George-Seven/Termux-XEMU/releases/latest/download/xemu-arm64.deb"
    apt install ./.install/xemu-arm64.deb openbox -y
    wget -q -O .script/xemu.sh https://raw.githubusercontent.com/namelessmint/Termux-mesa-wrapper-script/refs/heads/main/apps/start/xemustart.sh
    echo "alias xemu-init='~/.script/xemu.sh'" >> .bashrc
    echo " printf 'Digite xemu-init para iniciar o Xemu. \n'" >> .bashrc
    echo "XEMU instalado com sucesso!"
}


echo "Selecione a opção desejada:"
echo "1 - Instalar Wine Hangover"
echo "2 - Instalar RPCS3"
echo "3 - Instalar XEMU"
echo "4 - Instalar todos"
echo "5 - Sair"
read -p "Opção: " choice

case $choice in
    1)
        install_winehangover
        ;;
    2)
        install_rpcs3
        ;;
    3)
        install_xemu
        ;;
    4)
        install_winehangover
        install_rpcs3
        install_xemu
        ;;
    5)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida. Saindo..."
        exit 1
        ;;
esac

echo "Instalando o Mesa..."
wget -q https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/16%2F12/mesaup.deb -O .install/mesa.deb
dpkg -i ./.install/*.deb &> /dev/null
echo "Limpamdo arquivos temporarios..."
rm -r .install/

clear
printf "Instalação Concluída, Reinicie o Termux para continuar\n"
