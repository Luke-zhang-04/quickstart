#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
. "${DIR}/colours.sh"

#######################################
# Add .codeclimate.yml config
# Globals:
#   None
# Arguments:
#   codeclimate: boolean
#######################################
getCodeClimate() {
    if "$1"; then
        printf "\t${IGreen}CodeClimate requested\n\t${IBlue}Installing CodeClimate config file...\n"

        # Chceck for .codeclimate.yml
        printf "\t\t${IBlue}Checking for .codeclimate.yml file...${Cyan}\n"
        if test -f ".codeclimate.yml"; then # Check for .codeclimate.yml file
            printf "\t\t\t${IYellow}.codeclimate.yml exists${Cyan}\n"
        else
            # Get .codeclimate.yml file
            printf "\t\t\t${IGreen}.codeclimate.yml does not exist${Cyan}\n"
            printf "\t\t\t${IBlue}Getting .codeclimate.yml file...${Cyan}\n"
            mv ./quickstart/.codeclimate.yml ./.codeclimate.yml
            printf "\t\t\t${IGreen}Got .codeclimate.yml${Cyan}\n"
        fi

        printf "\t${IGreen}Installed CodeClimate!${Cyan}\n"
    else
        printf "\t${IYellow}CodeClimate not requested${Cyan}\n"
    fi
}
