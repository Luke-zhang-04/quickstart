#!/usr/bin/env bash
# Quickstart | React functions
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
. "${DIR}/colours.sh"

#######################################
# Move files made with create react app to root
# Globals:
#   none
# Arguments:
#   None
#######################################
moveReactFiles() {
    printf "\t\t${IBlue}Moving .client/node_modules/ to ./node_modules/${Cyan}\n"
    mv ./client/node_modules/ ./node_modules/ # Move node_modules out
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Moving .client/public/ to ./public/${Cyan}\n"
    mv ./client/public/ ./public/ # Move public out
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Moving .client/src/ to ./src/${Cyan}\n"
    mv ./client/src ./src/ # Move src out
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Removing .client/.gitignore${Cyan}\n"
    rm -r client/.gitignore # Remove .gitignore (already made)
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Moving .client/package.json to ./package.json${Cyan}\n"
    mv ./client/package.json ./package.json # Move package.json out
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Removing .client/README.md${Cyan}\n"
    rm -r client/README.md # Remove README.md
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Moving .client/tsconfig.json to ./tsconfig.json (if included)${Cyan}\n"
    mv ./client/tsconfig.json ./tsconfig.json # move tsconfig.json out
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Moving .client/yarn.lock to ./yarn.locl${Cyan}\n"
    mv ./client/yarn.lock ./yarn.lock # Move yarn.lock out
    printf "\t\t\t${IGreen}Done!\n\t\t${IBlue}Removing .client/client/${Cyan}\n"
    rm -rf ./client/ # Remove client folder
    printf "\t\t\t${IGreen}Done!${Cyan}\n"
}

#######################################
# Create react app
# Globals:
#   none
# Arguments:
#   reactApp: boolean
#   typescript: boolean
#######################################
reactApp() {
    if "$1"&&"$2"; then # React app w/ typescript
        printf "\t${IGreen}React with Typescript requested\n\t${IBlue}Installing React with Typescript...${Cyan}\n"
        npx create-react-app client --template typescript # Create React app named client, with typescript template
        printf "\t${IGreen}Installed React with Typescript!${Cyan}\n"
        moveReactFiles
    elif "$1"; then # React app wo/ typescript
        printf "\t${IGreen}React without Typescript requested\n\t${IBlue}Installing React...${Cyan}\n"
        npx create-react-app client # Create React app names client
        printf "\t${IGreen}Installed React!${Cyan}\n"
        printf "\t${IBlue}Moving React files...${CYan}\n"
        moveReactFiles
    else
        printf "\t${IYellow}React not requested${Cyan}\n"
    fi
}
