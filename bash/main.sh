#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

args="$*" # Passed in arguments
quickstartAscii="\033[0;36m
  ____        _      _        _             _   
 / __ \      (_)    | |      | |           | |  
| |  | |_   _ _  ___| | _____| |_ __ _ _ __| |_ 
| |  | | | | | |/ __| |/ / __| __/ _\` | '__| __|
| |__| | |_| | | (__|   <\__ \ || (_| | |  | |_ 
 \___\__\__,_|_|\___|_|\_\___/\__\__,_|_|   \__|
"
startupText="\033[0;36mCheck us out on GitHub! https://github.com/Luke-zhang-04/quickstart\nWe promise that none of our Gists contain malicious code, but why trust us? Go see for yourself!\nhttps://gist.github.com/Luke-zhang-04/140bea238fa6dec12929c220645540e1\nhttps://gist.github.com/Luke-zhang-04/d4c19d39f0a462fc79e0b3361752cf95\n"

#######################################
# Checks parameters
# Globals:
#   none
# Arguments:
#   global to set to
#   full arg name
#   short arg name (optional)
#######################################
checkParams() { # Check passed in arguments and match them
    if [[ "$args" == *"$2"* ]]; then
        eval "$1"=true
    elif [[ "$args" == *"$3"* ]]&&[[ "$3" ]]; then
        eval "$1"=true
    else 
        eval "$1"=false
    fi
}

# Check parameters for all the variables
checkParams react_app react
checkParams typescript typescript ts
checkParams eslint eslint
checkParams bootstrap bootstrap bs
checkParams noVer noVer nv

#######################################
# Create react app
# Globals:
#   bootstrap
# Arguments:
#   None
#######################################
getBootstrap() {
    if "$bootstrap"; then # If Bootstrap was requested
        printf "\t\033[0;92mBootstrap requested\n\t\033[0;94mInstalling Bootstrap...\033[0m\n"
        yarn add bootstrap # Add bootstrap with Yarn

        printf "\t\033[0;92mInstalled Bootstrap!\033[0m\n"
        printf "\t\033[0;94mChecking for scss directory...\033[0m\n"

        if [ -d "./scss" ]; then # Check for scss directory
            printf "\t\t\033[0;93mscss directory found\033[0m\n"
        else
            printf "\t\t\033[0;94mscss directory not found, creating scss directory...\033[0m\n"
            mkdir scss # Make a SCSS directory
            printf "\t\033[0;94mAdding default imports to scss/bootstrap.scss...\033[0m\n"
            # Add default imports into ./scss/bootstrap.scss
            printf "/*!\n * Bootstrap v4.5.0 (https://getbootstrap.com/)\n * Copyright 2011-2020 The Bootstrap Authors\n * Copyright 2011-2020 Twitter, Inc.\n * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)\n */\n\n// Required\n@import \"./../node_modules/bootstrap/scss/functions\";\n@import \"./../node_modules/bootstrap/scss/variables\";\n@import \"./../node_modules/bootstrap/scss/mixins\";\n\n// Optional\n@import \"./../node_modules/bootstrap/scss/root\";\n@import \"./../node_modules/bootstrap/scss/reboot\";\n@import \"./../node_modules/bootstrap/scss/type\";\n@import \"./../node_modules/bootstrap/scss/images\";\n@import \"./../node_modules/bootstrap/scss/code\";\n@import \"./../node_modules/bootstrap/scss/grid\";\n@import \"./../node_modules/bootstrap/scss/tables\";\n@import \"./../node_modules/bootstrap/scss/forms\";\n@import \"./../node_modules/bootstrap/scss/buttons\";\n@import \"./../node_modules/bootstrap/scss/transitions\";\n@import \"./../node_modules/bootstrap/scss/dropdown\";\n@import \"./../node_modules/bootstrap/scss/button-group\";\n@import \"./../node_modules/bootstrap/scss/input-group\";\n@import \"./../node_modules/bootstrap/scss/custom-forms\";\n@import \"./../node_modules/bootstrap/scss/nav\";\n@import \"./../node_modules/bootstrap/scss/navbar\";\n@import \"./../node_modules/bootstrap/scss/card\";\n@import \"./../node_modules/bootstrap/scss/breadcrumb\";\n@import \"./../node_modules/bootstrap/scss/pagination\";\n@import \"./../node_modules/bootstrap/scss/badge\";\n@import \"./../node_modules/bootstrap/scss/jumbotron\";\n@import \"./../node_modules/bootstrap/scss/alert\";\n@import \"./../node_modules/bootstrap/scss/progress\";\n@import \"./../node_modules/bootstrap/scss/media\";\n@import \"./../node_modules/bootstrap/scss/list-group\";\n@import \"./../node_modules/bootstrap/scss/close\";\n@import \"./../node_modules/bootstrap/scss/toasts\";\n@import \"./../node_modules/bootstrap/scss/modal\";\n@import \"./../node_modules/bootstrap/scss/tooltip\";\n@import \"./../node_modules/bootstrap/scss/popover\";\n@import \"./../node_modules/bootstrap/scss/carousel\";\n@import \"./../node_modules/bootstrap/scss/spinners\";\n@import \"./../node_modules/bootstrap/scss/utilities\";\n@import \"./../node_modules/bootstrap/scss/print\";\n" > scss/bootstrap.scss
        fi
        
        printf "\033[0;92mInstalled Bootstrap!\033[0m\n"
    else
        printf "\t\033[0;93mBootstrap not requested\033[0m\n"
    fi
}

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
#   react_app
#   typescript
# Arguments:
#   None
#######################################
reactApp() {
    if "$react_app"&&"$typescript"; then # React app w/ typescript
        printf "\t\033[0;92mReact with Typescript requested\n\t\033[0;94mInstalling React with Typescript...\033[0;36m\n"
        npx create-react-app client --template typescript # Create React app named client, with typescript template
        printf "\t\033[0;92mInstalled React with Typescript!\033[0;36m\n"
        moveReactFiles
    elif "$react_app"; then # React app wo/ typescript
        printf "\t\033[0;92mReact without Typescript requested\n\t\033[0;94mInstalling React...\033[0;36m\n"
        npx create-react-app client # Create React app names client
        printf "\t\033[0;92mInstalled React!\033[0;36m\n"
        moveReactFiles
    else
        printf "\tReact not requested\033[0;36m\n"
    fi
}

#######################################
# Main function
# Globals:
#   react_app
#   typescript
#   eslint
#   bootstrap
# Arguments:
#   None
#######################################
quickStart() {
    # Clone the quickstart Gist. Check this Gist's code first, in case you don't trust me (don't trust anyone).
    printf "\033[0;94mCloning quickstart gist from https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git\033[0;36m\n"
    git clone https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git quickstart

    printf "\033[0;94mGetting .gitignore file...\033[0;36m\n"
    mv ./quickstart/.gitignore ./.gitignore # Get .gitignore from quickstart

    printf "\033[0;94mChecking for React...\033[0;36m\n"
    reactApp

    printf "\033[0;94mChecking for Bootstrap...\033[0;36m\n"
    getBootstrap

    printf "\033[0;92mCleaning up...\033[0;36m\n"
    rm -rf ./quickstart # Get rid of quickstart
}

# Ask for proceeding
printf "$quickstartAscii"
printf "$startupText"
printf "\033[0;36mPreparing to quickstart with:\033[0;35m $args\033[0m\n"

if $noVer; then
    proceed="Y"
else
    printf "\033[0;33mProceed? [\033[1;92mY/\033[0;91mn\033[0m] "
    read proceed
fi

if [ "$proceed" = "Y" ]; then
    printf "\n\033[0;36mProceeding with quickstart\033[0;36m\n"
    quickStart
    printf "\033[1;92mQuickstart succesfully quickstarted your project!"
    exit 0
elif [ "$proceed" = "n" ]; then
    printf "\n\033[1;91mAborting quickstart . . .\n"
    exit 0
else
    printf "\n\033[1;91mUnknown input $proceed, aborting\n"
    exit 1
fi
