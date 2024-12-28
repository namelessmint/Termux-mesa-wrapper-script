#!/bin/bash                                          
cd ~/.update
clear


echo "Escolha a versão do Mesa para instalar:"
echo "1. Versão para Xclipe e Adreno (24.2.5-12)"
echo "2. Versão mais recente (24.3.1-3)"
echo "3. Versão para Mali (24.2.5-9)"
echo "4. Cancelar instalação"
read -p "Digite o número da sua escolha: " versao

URL_XCLIPSE="https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/16%2F12/mesaup.deb"
URL_BE="https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Mesamali/mesa-vulkan-icd-wrapper_24.3.1-3_aarch64.deb"
URL_MALI="https://github.com/namelessmint/Termux-mesa-wrapper-script/releases/download/Mesamali/mesa.deb"

instalar_mesa() {
    local url=$1
    local arquivo=${url##*/}

    wget -q $url -O $arquivo
    chmod +x $arquivo

    if [[ $arquivo == *.deb ]]; then
        echo "Instalando o mesa..."
        dpkg -i $arquivo
        rm *.deb
    fi
}

case $versao in
    1)
        instalar_mesa $URL_XCLIPSE
        ;;
    2)
        instalar_mesa $URL_BE
        ;;
    3)
        instalar_mesa $URL_MALI
        ;;
    4)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Escolha inválida!"
        ;;
esac

clear
echo "O Mesa foi atualizado"
