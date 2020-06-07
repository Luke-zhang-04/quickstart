#!/usr/bin/env bash
# Quickstart | React functions
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

#######################################
# Move files made with create react app to root
# Globals:
#   none
# Arguments:
#   None
#######################################
moveReactFiles() {
    mv ./client/node_modules/ ./node_modules/ # Move node_modules out
    mv ./client/public/ ./public/ # Move public out
    mv ./client/src ./src/ # Move src out
    rm -r client/.gitignore # Remove .gitignore (already made)
    mv ./client/package.json ./package.json # Move package.json out
    rm -r client/README.md # Remove README.md
    mv ./client/tsconfig.json ./tsconfig.json # move tsconfig.json out
    mv ./client/yarn.lock ./yarn.lock # Move yarn.lock out
    rm -rf ./client/ # Remove client folder
}

#######################################
# Create react app
# Globals:
#   none
# Arguments:
#   react_app: boolean
#   typescript: boolean
#######################################
reactApp() {
    if "$1"&&"$2"; then # React app w/ typescript
        printf "\t\033[0;92mReact with Typescript requested\n\t\033[0;94mInstalling React with Typescript...\033[0;36m\n"
        npx create-react-app client --template typescript # Create React app named client, with typescript template
        printf "\t\033[0;92mInstalled React with Typescript!\033[0;36m\n"
        moveReactFiles
    elif "$1"; then # React app wo/ typescript
        printf "\t\033[0;92mReact without Typescript requested\n\t\033[0;94mInstalling React...\033[0;36m\n"
        npx create-react-app client # Create React app names client
        printf "\t\033[0;92mInstalled React!\033[0;36m\n"
        moveReactFiles
    else
        printf "\t\033[0;93mReact not requested\033[0;36m\n"
    fi
}
