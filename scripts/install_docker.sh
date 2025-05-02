#!/bin/zsh
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

echo -e "${GREEN}====> UNINSTALL ALL DOCKER CONFLICTING PACKAGES${NO_COLOR}"

yay -Rns docker
rm -rf $DOCKER_CONFIG

echo -e "${GREEN}====> INSTALLING DOCKER${NO_COLOR}"

yay -S --noconfirm docker

mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.35.1/docker-compose-linux-x86_64 \
    -o $DOCKER_CONFIG/cli-plugins/docker-compose

chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo -e "${GREEN}====> RUNNING POSTINSTALL STUFF${NO_COLOR}"

# Start services
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Configure Docker to start on boot with systemd
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

echo -e "${GREEN}====> DONE!${NO_COLOR}"
