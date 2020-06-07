#!/usr/bin/env bash
# Quickstart | Stylelint
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

#######################################
# Add stylelint config
# Globals:
#   None
# Arguments:
#   stylelint: boolean
#######################################
getStylelint() {
    if "$1"; then
        printf "\t${IGreen}Stylelint requested\n\t${IBlue}Installing stylelint config file...\n"

        # Chceck for .stylelintrc.json
        printf "\t\t${IBlue}Checking for .stylelintrc.json file...${Cyan}\n"
        if test -f ".stylelintrc.json"; then # Check if .stylelintrc.json exists
            printf "\t\t\t${IYellow}.stylelintrc.json exists${Cyan}\n"
        else
            # Get .stylelintrc.json file
            printf "\t\t\t${IGreen}.stylelintrc.json does not exist${Cyan}\n"
            printf "\t\t\t${IBlue}Getting .stylelintrc.json file...${Cyan}\n"
            mv ./quickstart/.stylelintrc.json ./.stylelintrc.json
            printf "\t\t\t${IGreen}Got .stylelintrc.json${Cyan}\n"
        fi

        printf "\t\t${IBlue}Installing stylelint dependencies...${Cyan}\n"
        # Install stylelint, and stylelint config standard
        yarn add stylelint stylelint-config-standard -D
        printf "\t\t${IGreen}Installed stylelint dependencies!${Cyan}\n"

        printf "\t${IGreen}Installed Stylelint!${Cyan}\n"
    else
        printf "\t${IYellow}Stylelint not requested${Cyan}\n"
    fi
}
