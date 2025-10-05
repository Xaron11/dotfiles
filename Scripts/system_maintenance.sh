#!/bin/bash

# set -e

echo "- Checking if systemd services have failed:"
systemctl --failed
echo "- Updating pacman repositories:"
sudo pacman -Sy
echo "- Upgrading system:"
sudo pacman -Syu
read -p "Do you want to upgrade AUR packages? [y/n]" yn
case $yn in
        [Yy]* ) echo "- Upgrading AUR packages:"; yay -Syu --sudoloop --noconfirm;;
        [Nn]* ) ;;
        * ) ;;
esac
echo "- Removing pacman cache:"
sudo paccache -r
echo "- Removing orphaned packages:"
sudo pacman -Qtdq | sudo pacman -Rns -
echo "- Clearing /home cache:"
sudo rm -rf "~/.cache/*"
echo "- Clearing journal logs:"
sudo journalctl --vacuum-time=30d
read -p "Do you want to see the list of installed packages? [y/n]" yn
case $yn in
        [Yy]* ) package_info.sh;;
        [Nn]* ) ;;
        * ) ;;
esac

