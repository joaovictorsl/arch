#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING NODE${NO_COLOR}"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 22.15.0
asdf set -u nodejs 22.15.0

echo -e "${GREEN}====> DONE!${NO_COLOR}"
