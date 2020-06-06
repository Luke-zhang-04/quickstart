#!/usr/bin/env bash

args="$*" # Passed in arguments

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

cleanup() {
    cd .. # cd back 1 level
    rm -rf ./quickstart # Get rid of quickstart
}

#######################################
# Create react app
# Globals:
#   bootstrap
# Arguments:
#   None
#######################################
getBootstrap() {
    if "$bootstrap"; then # If Bootstrap was requested
        printf "\tFound bootstrap\n\tInstalling Bootstrap..."
        yarn add bootstrap # Add bootstrap with Yarn
        printf "\tInstalled Boostrap!\n\tMaking SCSS directory..."
        mkdir scss # Make a SCSS directory

        printf "Adding default imports to scss/bootstrap.scss..."
        # Add default imports into ./scss/bootstrap.scss
        printf "/*!\n * Bootstrap v4.5.0 (https://getbootstrap.com/)\n * Copyright 2011-2020 The Bootstrap Authors\n * Copyright 2011-2020 Twitter, Inc.\n * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)\n */\n\n// Required\n@import \"./../node_modules/bootstrap/scss/functions\";\n@import \"./../node_modules/bootstrap/scss/variables\";\n@import \"./../node_modules/bootstrap/scss/mixins\";\n\n// Optional\n@import \"./../node_modules/bootstrap/scss/root\";\n@import \"./../node_modules/bootstrap/scss/reboot\";\n@import \"./../node_modules/bootstrap/scss/type\";\n@import \"./../node_modules/bootstrap/scss/images\";\n@import \"./../node_modules/bootstrap/scss/code\";\n@import \"./../node_modules/bootstrap/scss/grid\";\n@import \"./../node_modules/bootstrap/scss/tables\";\n@import \"./../node_modules/bootstrap/scss/forms\";\n@import \"./../node_modules/bootstrap/scss/buttons\";\n@import \"./../node_modules/bootstrap/scss/transitions\";\n@import \"./../node_modules/bootstrap/scss/dropdown\";\n@import \"./../node_modules/bootstrap/scss/button-group\";\n@import \"./../node_modules/bootstrap/scss/input-group\";\n@import \"./../node_modules/bootstrap/scss/custom-forms\";\n@import \"./../node_modules/bootstrap/scss/nav\";\n@import \"./../node_modules/bootstrap/scss/navbar\";\n@import \"./../node_modules/bootstrap/scss/card\";\n@import \"./../node_modules/bootstrap/scss/breadcrumb\";\n@import \"./../node_modules/bootstrap/scss/pagination\";\n@import \"./../node_modules/bootstrap/scss/badge\";\n@import \"./../node_modules/bootstrap/scss/jumbotron\";\n@import \"./../node_modules/bootstrap/scss/alert\";\n@import \"./../node_modules/bootstrap/scss/progress\";\n@import \"./../node_modules/bootstrap/scss/media\";\n@import \"./../node_modules/bootstrap/scss/list-group\";\n@import \"./../node_modules/bootstrap/scss/close\";\n@import \"./../node_modules/bootstrap/scss/toasts\";\n@import \"./../node_modules/bootstrap/scss/modal\";\n@import \"./../node_modules/bootstrap/scss/tooltip\";\n@import \"./../node_modules/bootstrap/scss/popover\";\n@import \"./../node_modules/bootstrap/scss/carousel\";\n@import \"./../node_modules/bootstrap/scss/spinners\";\n@import \"./../node_modules/bootstrap/scss/utilities\";\n@import \"./../node_modules/bootstrap/scss/print\";\n" >> scss/bootstrap.scss
        printf "\tInstalled Bootstrap!"
    else
        printf "\tBootstrap not found"
    fi
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
        printf "\tFound React with Typescript\n\tInstalling React with Typescript..."
        npx create-react-app client --template typescript # Create React app named client, with typescript template
        printf "\tInstalled React with Typescript!"
        cd client # cd into client
    elif "$react_app"; then # React app wo/ typescript
        printf "\tFound React without Typescript\n\tInstalling React..."
        npx create-react-app client # Create React app names client
        printf "\tInstalled React!"
        cd client # cd into client
    else
        printf "\tReact not found"
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
    # Clone the quickstart Gist. Check this Gist for malicious code first, in case you don't trust me (don't trust anyone).
    printf "Cloning quickstart gist from https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git"
    git clone https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git
    mv d4c19d39f0a462fc79e0b3361752cf95 quickstart # Change name to quickstart

    printf "Getting .gitignore file...\n"
    mv ./quickstart/.gitignore ./.gitignore # Get .gitignore from quickstart

    printf "Checking for React...\n"
    reactApp

    printf "Checking for Bootstrap...\n"
    getBootstrap

    printf "Cleaning up...\n"
    cleanup
}

# Ask for proceeding
printf "Preparing to quickstart with: $args\n"

if ! [ "$noVer" ]; then
    read -n 1 -p "Proceed? [Y/n] " proceed
else
    proceed="Y"
fi

if [ "$proceed" = "Y" ]; then
    printf "\nProceeding with quickstart\n"
    quickStart
    printf "Quickstart succesfully quickstarted your project!"
    exit 0
elif [ "$proceed" = "n" ]; then
    printf "\nAborting quickstart . . .\n"
    exit 0
else
    printf "\nUnknown input $proceed, aborting\n"
    exit 1
fi
