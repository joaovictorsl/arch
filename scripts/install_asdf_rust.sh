#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING RUST${NO_COLOR}"

asdf plugin add rust https://github.com/code-lever/asdf-rust.git
asdf install rust 1.86.0
asdf set -u rust 1.86.0

echo -e "${GREEN}====> DONE!${NO_COLOR}"
