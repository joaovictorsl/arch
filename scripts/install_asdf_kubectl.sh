#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING KUBECTL${NO_COLOR}"

asdf plugin add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf install kubectl 1.33.1
asdf set -u kubectl 1.33.1

echo -e "${GREEN}====> DONE!${NO_COLOR}"
