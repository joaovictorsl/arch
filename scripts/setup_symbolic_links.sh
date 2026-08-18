#!/bin/bash
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> SETTING UP SYMBOLIC LINKS${NO_COLOR}"

REPO_ROOT=$1

mkdir -p $HOME/.config

rm -rf $HOME/.zshrc
ln -s $REPO_ROOT/terminal/.zshrc $HOME/.zshrc

rm -rf $HOME/.p10k.zsh
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

rm -rf $HOME/.config/waybar
ln -s $REPO_ROOT/.config/waybar $HOME/.config/waybar

rm -rf $HOME/.config/rofi
ln -s $REPO_ROOT/.config/rofi $HOME/.config/rofi

rm -rf $HOME/.config/swaync
ln -s $REPO_ROOT/.config/swaync $HOME/.config/swaync

rm -rf $HOME/.config/wal
ln -s $REPO_ROOT/.config/wal $HOME/.config/wal

echo -e "${GREEN}====> DONE!${NO_COLOR}"
