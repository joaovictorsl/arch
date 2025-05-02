#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING ASDF${NO_COLOR}"

curl -L https://github.com/asdf-vm/asdf/releases/download/v0.16.7/asdf-v0.16.7-linux-amd64.tar.gz | tar xz
sudo mv asdf /usr/bin/

echo -e "${GREEN}====> DONE!${NO_COLOR}"
