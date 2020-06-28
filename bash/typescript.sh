#!/usr/bin/env bash
# Quickstart | Typescript install functions
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
. "${DIR}/colours.sh"

#######################################
# Install typescript
# Globals:
#   none
# Arguments:
#   react_app: boolean
#   typescript: boolean
#######################################
getTypescript() {
    if [ !"$1" ]&&"$2"; then
        printf "\t${IGreen}Typescript without React requested\n\t${IBlue}Installing Typescript...${Cyan}\n"
        yarn add typescript

        printf "\t\t${IBlue}Initlaizing tsconfig.json file\n${Cyan}\t\t\t"
        npx tsc --init
    else
        printf "\t${IYellow}Standalone Typescript not requested${Cyan}\n"
    fi
}
