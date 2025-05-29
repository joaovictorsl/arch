#!/bin/bash
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

ABSOLUTE_PATH=$(readlink -f "$0")
DIR=$(dirname $ABSOLUTE_PATH)

$DIR/scripts/config_git.sh

$DIR/scripts/install_yay.sh

$DIR/scripts/install_oh_my_zsh.sh
$DIR/scripts/setup_symbolic_links.sh $DIR

$DIR/scripts/install_asdf.sh
$DIR/scripts/install_asdf_rust.sh
$DIR/scripts/install_asdf_golang.sh
$DIR/scripts/install_asdf_node.sh
$DIR/scripts/install_asdf_flutter.sh
$DIR/scripts/install_asdf_kubectl.sh
$DIR/scripts/install_asdf_k9s.sh

$DIR/scripts/install_docker.sh

$DIR/scripts/install_others.sh
