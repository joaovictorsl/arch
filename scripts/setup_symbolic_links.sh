#!/bin/bash
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> SETTING UP SYMBOLIC LINKS${NO_COLOR}"

REPO_ROOT=$1

mkdir -p $HOME/.config

rm $HOME/.zshrc
ln -s $REPO_ROOT/terminal/.zshrc $HOME/.zshrc

rm $HOME/.p10k.zsh
ln -s $REPO_ROOT/terminal/.p10k.zsh $HOME/.p10k.zsh

rm -rf $HOME/.config/hypr
ln -s $REPO_ROOT/.config/hypr $HOME/.config/hypr

rm -rf $HOME/.config/ghostty
ln -s $REPO_ROOT/.config/ghostty $HOME/.config/ghostty

rm -rf $HOME/.config/nvim
ln -s $REPO_ROOT/.config/nvim $HOME/.config/nvim

rm -rf $HOME/.config/rofi
ln -s $REPO_ROOT/.config/rofi $HOME/.config/rofi

rm -rf $HOME/.config/mise
ln -s $REPO_ROOT/.config/mise $HOME/.config/mise

echo -e "${GREEN}====> DONE!${NO_COLOR}"
