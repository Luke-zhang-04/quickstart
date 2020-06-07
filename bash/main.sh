#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
scripts=("bootstrap" "eslint" "react")

# Import other scripts from bash directory
for script in "${scripts[@]}"; do
    . "${DIR}/${script}.sh"
done

. "${DIR}/colours.sh"

args="$*" # Passed in arguments
quickstartAscii="$Cyan
  ____        _      _        _             _   
 / __ \      (_)    | |      | |           | |  
| |  | |_   _ _  ___| | _____| |_ __ _ _ __| |_ 
| |  | | | | | |/ __| |/ / __| __/ _\` | '__| __|
| |__| | |_| | | (__|   <\__ \ || (_| | |  | |_ 
 \___\__\__,_|_|\___|_|\_\___/\__\__,_|_|   \__|
"
startupText="${Cyan}Check us out on GitHub! https://github.com/Luke-zhang-04/quickstart\nWe promise that none of our dependencies, remote repositories/Gists, or shell scripts contain malicious code, but why trust us? Go see for yourself!\nhttps://gist.github.com/Luke-zhang-04/140bea238fa6dec12929c220645540e1\nhttps://gist.github.com/Luke-zhang-04/d4c19d39f0a462fc79e0b3361752cf95\n"

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
    printf "${IBlue}Cloning quickstart gist from https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git${Cyan}\n"
    git clone https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git quickstart

    printf "${IBlue}Checking for .gitignore file...${Cyan}\n"
    if test -f ".gitignore"; then
        printf "\t${IYellow}.gitignore exists${Cyan}\n"
    else
        printf "\t${IGreen}.gitignore does not exist${Cyan}\n"
        printf "\t${IBlue}Getting .gitignore file...${Cyan}\n"
        mv ./quickstart/.gitignore ./.gitignore # Get .gitignore from quickstart
        printf "\t${IGreen}Got .gitignore file${Cyan}\n"
    fi

    printf "${IBlue}Checking for React...${Cyan}\n"
    reactApp "$react_app" "$typescript"

    printf "${IBlue}Checking for Bootstrap...${Cyan}\n"
    getBootstrap "$bootstrap"

    printf "${IBlue}Checking for Eslint...${Cyan}\n"
    getEslint "$eslint" "$typescript"

    printf "${IGreen}Cleaning up...${Cyan}\n"
    rm -rf ./quickstart # Get rid of quickstart
}

# Ask for proceeding
printf "$quickstartAscii"
printf "$startupText"
printf "${Cyan}Preparing to quickstart with:${Purple} $args${RESET}\n"

if $noVer; then
    proceed="Y"
else
    printf "${Yellow}Proceed? [${BIGreen}Y${Yellow}/${IRed}n${Yellow}]${RESET} "
    read proceed
fi

if [ "$proceed" = "Y" ]; then
    printf "\n${Cyan}Proceeding with quickstart${Cyan}\n"
    quickStart
    printf "${BIGreen}Quickstart succesfully quickstarted your project!"
    exit 0
elif [ "$proceed" = "n" ]; then
    printf "\n${BIRed}Aborting quickstart . . .\n"
    exit 0
else
    printf "\n${BIRed}Unknown input $proceed, aborting\n"
    exit 1
fi
