#!/bin/bash
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> CONFIG GIT${NO_COLOR}"

echo "Name:"
read name
echo "Email:"
read email

git config --global user.name "$name"
git config --global user.email "$email"
git config --global init.defaultBranch main

echo -e "${GREEN}====> DONE!${NO_COLOR}"
