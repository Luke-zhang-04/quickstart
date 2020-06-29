#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

version="1.1.0"

# tabs 8

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
scripts=("bootstrap" "codeclimate" "eslint" "make" "react" "stylelint" "typescript")

# Import other scripts from bash directory
for script in "${scripts[@]}"; do
    . "${DIR}/${script}.sh"
done

. "${DIR}/colours.sh"

argString="$*" # Passed in arguments
IFS=" " read -ra args <<< "$argString"
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
# Checks parameters and returns their existence
# Globals:
#   args: string[] - aka sys.argv
# Arguments:
#   full arg name
#   short arg name (optional)
#######################################
checkParams() { # Check passed in arguments and match them
    for arg in "${args[@]}"; do
        if [[ "$arg" == "$1" ]]; then
            printf true
            return 0
        elif [[ "$arg" == "$2" ]]; then
            printf true
            return 0
        fi
    done
    printf false
    return 1
}

# Check parameters for all the variables
bootstrap="$(checkParams bootstrap bs)"
codeclimate="$(checkParams codeclimate cc)"
eslint="$(checkParams eslint esl)"
make="$(checkParams makefile make)"
noVer="$(checkParams noVer nv)"
typescript="$(checkParams typescript ts)"
reactApp="$(checkParams react)"
stylelint="$(checkParams stylelint slint)"
help="$(checkParams -h --help)"

#######################################
# Main function
# Globals:
#   reactApp
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

    printf "${IBlue}Checking for package.json file...${Cyan}\n"
    if test -f "package.json"; then
        printf "\t${IYellow}package.json exists${Cyan}\n"
    else
        printf "\t${IGreen}package.json does not exist${Cyan}\n"
        printf "\t${IBlue}Creating package.json file...${Cyan}\n"
        npm init -y
        printf "\t${IGreen}Created package.json file${Cyan}\n"
    fi

    printf "${IBlue}Checking for React...${Cyan}\n"
    reactApp "$reactApp" "$typescript"

    printf "${IBlue}Checking for Bootstrap...${Cyan}\n"
    getBootstrap "$bootstrap"

    printf "${IBlue}Checking for standalone Typescript...${Cyan}\n"
    getTypescript "$reactApp" "$typescript"

    printf "${IBlue}Checking for Eslint...${Cyan}\n"
    getEslint "$eslint" "$typescript" "$reactApp"

    printf "${IBlue}Checking for CodeClimate...${Cyan}\n"
    getCodeClimate "$codeclimate"

    printf "${IBlue}Checking for Stylelint...${Cyan}\n"
    getStylelint "$stylelint"

    printf "${IBlue}Checking for Make...${Cyan}\n"
    makeMakefile "$make" "$bootstrap" "$eslint" "$stylelint" "$reactApp" "$typescript"
}

# Ask for proceeding
printf "$quickstartAscii"
printf "$startupText"

if $help; then
    printf "${Cyan}Usage: ${IBlue}Quickstart ${IGreen}[options]${Cyan}\n\n"

    printf "${IBlue}Options:${Cyan}\n"
    printf "  ${IGreen}bootstrap bs${Cyan}    add bootstrap and configure SCSS file\n"
    printf "  ${IGreen}codeclimate cc${Cyan}  add codeclimate configuration\n"
    printf "  ${IGreen}eslint esl${Cyan}      add eslint configuration and ignore file\n"
    printf "  ${IGreen}makefile make${Cyan}   add makefile with compile and lint commands\n"
    printf "  ${IGreen}noVer nv${Cyan}        skip verification and download immediately\n"
    printf "  ${IGreen}react${Cyan}           initialize React application\n"
    printf "  ${IGreen}stylelint slint${Cyan} add stylelint configuration\n"
    printf "  ${IGreen}typescript ts${Cyan}   add Typescript and configure as needed\n"
    printf "  ${IGreen}-h --help${Cyan}       display help for command\n"
    printf "\n\n${Cyan}Pass in no options for selection menu\n"
    exit 0
fi

if [[ "$argString" == "" ]]; then
    . "${DIR}/selection.sh"

    menu "${scripts[@]}"

    bootstrap="$(checkOptions bootstrap)"
    codeclimate="$(checkOptions codeclimate)"
    eslint="$(checkOptions eslint)"
    make="$(checkOptions make)"
    typescript="$(checkOptions typescript)"
    reactApp="$(checkOptions react)"
    stylelint="$(checkOptions stylelint)"

    printf "${Cyan}Preparing to quickstart with:${Purple} $(showSelected)${RESET}\n"
else
    printf "${Cyan}Preparing to quickstart with:${Purple} $argString${RESET}\n"
fi

if $noVer; then
    proceed="Y"
else
    printf "${Yellow}Proceed? [${BIGreen}Y${Yellow}/${IRed}n${Yellow}]${RESET} "
    read proceed
fi

if [ "$proceed" = "Y" ]; then
    printf "\n${Cyan}Proceeding with quickstart${Cyan}\n"
    quickStart # Invoke main quickstart function
    printf "\n${BIGreen}Quickstart succesfully quickstarted your project!${Cyan}\n"
    printf "${BIGreen}Please consider mentioning us in your next commit!\n${Cyan}\"Initialized project with Quickstart https://github.com/Luke-zhang-04/quickstart\"${Cyan}\n"

    latest=$(head -n 1 ./quickstart/version.txt)

    if [[ "$latest" == "$version" ]]; then
        printf "\n${IBlue}Your quickstart verion ${IGreen}$version${IBlue} is up to date${Cyan}\n"
    else
        printf "${IYellow}
        ______________________________________________________________________________________________________________
        | Your quickstart version is ${IRed}$version${IYellow}.                                                                          |
        | A new version of quickstart ${IGreen}($latest)${IYellow} has been released.                                                     |
        | ${IBlue}Consider upgrading ${IRed}$version ${IBlue}-> ${IGreen}$latest ${IYellow}                                                                         |${IYellow}
        | You can curl ${IBlue}\"curl -L https://github.com/Luke-zhang-04/quickstart/archive/$latest.tar.gz | tar zx\"${IYellow}           |
        | Or download from GitHub ${IBlue}https://github.com/Luke-zhang-04/quickstart${IYellow}                                        |
        | Or clone from GitHub through the CLI ${IBlue}\"git clone https://github.com/Luke-zhang-04/quickstart.git quickstart\"${IYellow}|
        |____________________________________________________________________________________________________________|${Cyan}\n\n"
    fi

    printf "\n${IGreen}Cleaning up...${Cyan}\n"
    rm -rf ./quickstart # Get rid of quickstart
    exit 0
elif [ "$proceed" = "n" ]; then
    printf "\n${BIRed}Aborting quickstart . . .\n"
    exit 0
else
    printf "\n${BIRed}Unknown input $proceed, aborting\n"
    exit 1
fi
