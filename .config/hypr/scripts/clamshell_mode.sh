#!/bin/zsh

if [[ "$(hyprctl monitors)" =~ "\sHDMI-+" ]]; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,auto"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
fi
