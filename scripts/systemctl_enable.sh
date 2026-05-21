#!/bin/bash
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

echo -e "${GREEN}====> ENABLING SYSTEMCTL SERVICES${NO_COLOR}"

sudo systemctl enable bluetooth

echo -e "${GREEN}====> DONE!${NO_COLOR}"
