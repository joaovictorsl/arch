#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING FLUTTER${NO_COLOR}"

asdf plugin add flutter https://github.com/oae/asdf-flutter.git
asdf install flutter 3.29.3-stable
asdf set -u flutter 3.29.3-stable

yay -S --noconfirm android-studio

echo -e "${GREEN}====> DONE!${NO_COLOR}"
