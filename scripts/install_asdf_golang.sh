#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING GOLANG${NO_COLOR}"

asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.24.2
asdf set -u golang 1.24.2

$HOME/.asdf/shims/go install github.com/air-verse/air@latest
$HOME/.asdf/shims/go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

echo -e "${GREEN}====> DONE!${NO_COLOR}"
