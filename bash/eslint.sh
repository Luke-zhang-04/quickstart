#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
. "${DIR}/colours.sh"

#######################################
# Clones Gist for eslint config files at https://gist.github.com/140bea238fa6dec12929c220645540e1.git
# Globals:
#   None
# Arguments:
#   None
#######################################
cloneConfigGist() {
    # Clone the quickstart Gist. Check this Gist's code first, in case you don't trust me (don't trust anyone).
    printf "\t${IBlue}Cloning Eslint config files Gist${Cyan}\n"
    git clone https://gist.github.com/140bea238fa6dec12929c220645540e1.git eslint
}

#######################################
# Configure Eslint
# Globals:
#   None
# Arguments:
#   eslint: boolean
#   typescript: boolean
#######################################
getEslint() {
    if "$1"&&"$2"; then
        printf "\t${IGreen}Eslint with Typescript requested\n\t${IBlue}Installing Eslint with Typescript...\n"
        cloneConfigGist
        printf "\t${IGreen}Installed Eslint with Typescript!${Cyan}\n"
    elif "$1"; then
        printf "\t${IGreen}Eslint without Typescript requested\n\t${IBlue}Installing Eslint with Typescript...\n"
        cloneConfigGist
        printf "\t${IGreen}Installed Eslint without Typescript!${Cyan}\n"
    else
        printf "\t${IYellow}Eslint not requested${Cyan}\n"
    fi
}
