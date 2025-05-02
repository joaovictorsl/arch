#!/bin/bash
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING YAY${NO_COLOR}"

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

cd ..
rm -rf yay-bin

echo -e "${GREEN}====> DONE!${NO_COLOR}"
