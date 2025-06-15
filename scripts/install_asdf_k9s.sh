#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING K9S${NO_COLOR}"

asdf plugin add k9s https://github.com/looztra/asdf-k9s.git
asdf install k9s 0.50.6
asdf set -u k9s 0.50.6

echo -e "${GREEN}====> DONE!${NO_COLOR}"
