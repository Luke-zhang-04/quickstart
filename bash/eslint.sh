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
#   reactApp: boolean
#######################################
cloneConfigGist() {
    # Clone the quickstart Gist. Check this Gist's code first, in case you don't trust me (don't trust anyone).
    printf "\t${IBlue}Cloning Eslint config files Gist from https://gist.github.com/140bea238fa6dec12929c220645540e1.git${Cyan}\n"
    git clone https://gist.github.com/140bea238fa6dec12929c220645540e1.git eslint

    # Chceck for .eslint ignore
    printf "\t\t${IBlue}Checking for .eslintignore file...${Cyan}\n"
    if test -f ".eslintignore"; then
        printf "\t\t\t${IYellow}.eslintignore exists${Cyan}\n"
    else
        # Get .eslintignore file
        printf "\t\t\t${IGreen}.eslintignore does not exist${Cyan}\n"
        printf "\t\t\t${IBlue}Getting .eslintignore file...${Cyan}\n"
        mv ./eslint/.eslintignore ./.eslintignore
        printf "\t\t\t${IGreen}Got .eslintignore ${Cyan}\n"
    fi

    printf "\t\t${IBlue}Checking for reactApp...${Cyan}\n"
    if $1; then
        printf "\t\t\t${IYellow}ReactApp found${Cyan}\n"
    else
        printf "\t\t\t${IGreen}ReactApp not found${Cyan}\n"
        printf "\t\t\t${IBlue}Installing eslint independently${Cyan}\n"
        yarn add eslint eslint-config-recommended -D
        printf "\t\t\t${IGreen}Eslint installed!${Cyan}\n"
    fi
}

#######################################
# Configure Eslint
# Globals:
#   None
# Arguments:
#   eslint: boolean
#   typescript: boolean
#   reactApp: boolean
#######################################
getEslint() {
    if "$1"&&"$2"&&"$3"; then # React app with typescript
        printf "\t${IGreen}Eslint with Typescript and React requested\n\t${IBlue}Installing Eslint with Typescript and React...\n"
        cloneConfigGist "$3"

        # Chceck for .eslintrc
        printf "\t\t${IBlue}Checking for .eslintrc.json file...${Cyan}\n"
        if test -f ".eslintrc.json"; then # Check to see is .eslintrc.json exists
            printf "\t\t\t${IYellow}.eslintrc.json exists${Cyan}\n"
        else
            # Get .eslintrc file
            printf "\t\t\t${IGreen}.eslintrc does not exist${Cyan}\n"
            printf "\t\t\t${IBlue}Getting .eslintrc.json file...${Cyan}\n"
            mv ./eslint/typescript.eslintrc.json ./.eslintrc.json
            printf "\t\t\t${IGreen}Got .eslintrc.json${Cyan}\n"
        fi

        printf "\t\t${IBlue}Installing .eslint dependencies...${Cyan}\n"
        # Install typescript eslint, typescript eslint parser, eslint prefer arrow, and eslint react plugin
        yarn add @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-prefer-arrow eslint-plugin-react -D
        printf "\t\t${IGreen}Installed .eslint dependencies!${Cyan}\n"

        rm -rf ./eslint # Remove eslint directory
        printf "\t${IGreen}Installed Eslint with Typescript and React!${Cyan}\n"
    elif "$1"&&"$3"; then # React app without typescript
        printf "\t${IGreen}Eslint without Typescript, with React requested\n\t${IBlue}Installing Eslint without Typescript, with React...\n"
        cloneConfigGist "$3"

        # Chceck for .eslintrc
        printf "\t\t${IBlue}Checking for .eslintrc file...${Cyan}\n"
        if test -f ".eslintrc"; then
            printf "\t\t\t${IYellow}.eslintrc exists${Cyan}\n"
        else
            # Get .eslintrc file
            printf "\t\t\t${IGreen}.eslintrc does not exist${Cyan}\n"
            printf "\t\t\t${IBlue}Getting .eslintrc file...${Cyan}\n"
            mv ./eslint/.eslintrc.json ./.eslintrc.json # Get .eslintrc.json
            printf "\t\t\t${IGreen}Got .eslintrc ${Cyan}\n"
        fi

        printf "\t\t${IBlue}Installing .eslint dependencies...${Cyan}\n"
        yarn add eslint-plugin-prefer-arrow eslint-plugin-react -D # Install eslint prefer arrow and eslint react plugin
        printf "\t\t${IGreen}Installed .eslint dependencies!${Cyan}\n"

        rm -rf ./eslint # Remove eslint directory
        printf "\t${IGreen}Installed Eslint without Typescript, with React!${Cyan}\n"
    elif "$1"&&"$2"; then # Eslint with typescript, without react
        printf "\t${IGreen}Eslint with Typescript, without React requested\n\t${IBlue}Installing Eslint with Typescript, without react...\n"
        cloneConfigGist "$3"

        # Chceck for .eslintrc
        printf "\t\t${IBlue}Checking for .eslintrc.json file...${Cyan}\n"
        if test -f ".eslintrc.json"; then # Check to see is .eslintrc.json exists
            printf "\t\t\t${IYellow}.eslintrc.json exists${Cyan}\n"
        else
            # Get .eslintrc file
            printf "\t\t\t${IGreen}.eslintrc does not exist${Cyan}\n"
            printf "\t\t\t${IBlue}Getting .eslintrc.json file...${Cyan}\n"
            mv ./eslint/typescript-no-react.eslintrc.json ./.eslintrc.json
            printf "\t\t\t${IGreen}Got .eslintrc.json${Cyan}\n"
        fi

        printf "\t\t${IBlue}Installing .eslint dependencies...${Cyan}\n"
        # Install typescript eslint, typescript eslint parser, and eslint prefer arrow plugin
        yarn add @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-prefer-arrow -D
        printf "\t\t${IGreen}Installed .eslint dependencies!${Cyan}\n"

        rm -rf ./eslint # Remove eslint directory
        printf "\t${IGreen}Installed Eslint with Typescript, without React!${Cyan}\n"
    elif "$1"; then # Eslint without typescript, without react
        printf "\t${IGreen}Eslint without Typescript or React requested\n\t${IBlue}Installing Eslint without Typescript or react...\n"
        cloneConfigGist "$3"

        # Chceck for .eslintrc
        printf "\t\t${IBlue}Checking for .eslintrc.json file...${Cyan}\n"
        if test -f ".eslintrc.json"; then # Check to see is .eslintrc.json exists
            printf "\t\t\t${IYellow}.eslintrc.json exists${Cyan}\n"
        else
            # Get .eslintrc file
            printf "\t\t\t${IGreen}.eslintrc does not exist${Cyan}\n"
            printf "\t\t\t${IBlue}Getting .eslintrc.json file...${Cyan}\n"
            mv ./eslint/no-react.eslintrc.json  ./.eslintrc.json
            printf "\t\t\t${IGreen}Got .eslintrc.json${Cyan}\n"
        fi

        printf "\t\t${IBlue}Installing .eslint dependencies...${Cyan}\n"
        # Install typescript eslint, typescript eslint parser, and eslint prefer arrow plugin
        yarn add eslint-plugin-prefer-arrow -D
        printf "\t\t${IGreen}Installed .eslint dependencies!${Cyan}\n"

        rm -rf ./eslint # Remove eslint directory
        printf "\t${IGreen}Installed Eslint without Typescript or React!${Cyan}\n"
    else
        printf "\t${IYellow}Eslint not requested${Cyan}\n"
    fi
}
