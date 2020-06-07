#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
scripts=("bootstrap" "eslint" "react")

# Import other scripts from bash directory
for script in "${scripts[@]}"; do
    . "$DIR/$script.sh"
done

args="$*" # Passed in arguments
quickstartAscii="\033[0;36m
  ____        _      _        _             _   
 / __ \      (_)    | |      | |           | |  
| |  | |_   _ _  ___| | _____| |_ __ _ _ __| |_ 
| |  | | | | | |/ __| |/ / __| __/ _\` | '__| __|
| |__| | |_| | | (__|   <\__ \ || (_| | |  | |_ 
 \___\__\__,_|_|\___|_|\_\___/\__\__,_|_|   \__|
"
startupText="\033[0;36mCheck us out on GitHub! https://github.com/Luke-zhang-04/quickstart\nWe promise that none of our dependencies, remote repositories/Gists, or shell scripts contain malicious code, but why trust us? Go see for yourself!\nhttps://gist.github.com/Luke-zhang-04/140bea238fa6dec12929c220645540e1\nhttps://gist.github.com/Luke-zhang-04/d4c19d39f0a462fc79e0b3361752cf95\n"

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
checkParams stylelint stylelint
checkParams bootstrap bootstrap bs
checkParams noVer noVer nv


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

    printf "\033[0;94mChecking for .gitignore file...\033[0;36m\n"
    if test -f ".gitignore"; then
        printf "\t\033[0;93m.gitignore exists\033[0;36m\n"
    else
        printf "\t\033[0;.gitignore does not exist\033[0;36m\n"
        printf "\033[0;94mGetting .gitignore file...\033[0;36m\n"
        mv ./quickstart/.gitignore ./.gitignore # Get .gitignore from quickstart
    fi

    printf "\033[0;94mChecking for React...\033[0;36m\n"
    reactApp "$react_app" "$typescript"

    printf "\033[0;94mChecking for Bootstrap...\033[0;36m\n"
    getBootstrap "$bootstrap"

    printf "\033[0;94mChecking for Eslint...\033[0;36m\n"
    getEslint "$eslint" "$typescript"

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
    printf "\033[0;33mProceed? [\033[1;92mY\033[0;94m/\033[0;91mn\033[0m] "
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
