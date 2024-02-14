#!/bin/bash

sudo apt update



install_if_not_installed() {
    if ! dpkg -l | grep -q $1
    then
        echo "$1 is not installed. Installing..."
        sudo apt install -y $1
    else
        echo "$1 is already installed. Skipping..."
    fi
}

install_if_not_installed "parole"
install_if_not_installed "vlc"
install_if_not_installed "gimp"
install_if_not_installed "krita"
install_if_not_installed "inkscape"
install_if_not_installed "libreoffice-draw"
install_if_not_installed "thunderbird"
install_if_not_installed "kmail"
install_if_not_installed "wine"
install_if_not_installed "build-essential"
install_if_now_installed "qutebrowser"

if ! dpkg -l | grep -q discord
then
    echo "Discord is not installed. Installing..."
    wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo apt install -y ./discord.deb
    Y
    rm discord.deb
else
    echo "Discord is already installed. Skipping..."
fi

if ! dpkg -l | grep -q skypeforlinux
then
    echo "Skype is not installed. Installing..."
    wget https://go.skype.com/skypeforlinux-64.deb
    sudo apt install -y ./skypeforlinux-64.deb
    rm skypeforlinux-64.deb
else
    echo "Skype is already installed. Skipping..."
fi

wget https://ia801006.us.archive.org/17/items/plantsvs.zombies_201909/Plants%20vs.%20Zombies.zip
apt install wine
Y

sudo dpkg --add-architecture i386 
sudo apt-get update
sudo apt-get install wine32:i386
sudo apt install qutebrowser

echo "\n\n\n\n\n\n\nInstallation completed."

echo "Installed applications:"
echo "- Vector Editor: Inkscape,libreoffice-draw"
echo "- Raster Editors: GIMP, Krita"
echo "- Media Players: VLC, Parole"
echo "- Discord, skype"
echo "- Thunderbird, kmail"
echo "- firefox , qutebrowser"
