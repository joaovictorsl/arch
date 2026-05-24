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
    unzip \
    lazygit \
    nvim \
    wl-clipboard \
    ghostty \
    hyprland \
    hyprpaper \
    hyprshot \
    waybar \
    swaync \
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
    ttf-nerd-fonts-symbols \
    ttf-jetbrains-mono-nerd \
    otf-font-awesome \
    xdg-desktop-portal \
    xdg-desktop-portal-wlr \
    obsidian \
    zen-browser-bin \
    beekeeper-studio-bin \
    python-pywal16

echo -e "${GREEN}====> DONE!${NO_COLOR}"
