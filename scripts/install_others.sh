#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> INSTALLING OTHERS${NO_COLOR}"

yay -S --noconfirm \
    fd \
    fzf \
    less \
    ripgrep \
    tree \
    lazygit \
    nvim \
    ghostty \
    hyprland \
    hyprpaper \
    waybar \
    rofi \
    google-chrome \
    openssh \
    tmux \
    blueman \
    man-db \
    man-pages \
    ninja \
    clang \
    cmake \
    ngrok \
    noto-fonts-emoji \
    otf-font-awesome \
    xdg-desktop-portal \
    xdg-desktop-portal-wlr \
    android-studio \
    obsidian \
    zen-browser \
    beekeeper-studio-bin \
    stremio

echo -e "${GREEN}====> DONE!${NO_COLOR}"
