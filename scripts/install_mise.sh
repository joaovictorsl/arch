#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING MISE${NO_COLOR}"

yay -S --noconfirm mise
mise install

echo -e "${GREEN}====> DONE!${NO_COLOR}"
