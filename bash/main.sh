#!/usr/bin/env bash

args="$*" # Passed in arguments

checkParams() { # Check passed in arguments and match them
    if [[ $args == *"$2"* ]]; then
        eval $1=true
    elif [[ $args == *"$3"* ]]&&[[ "$3" ]]; then
        eval $1=true
    else 
        eval $1=false
    fi
}

# Check parameters for all the variables
checkParams react_app react
checkParams typescript typescript ts
checkParams eslint eslint
checkParams bootstrap bootstrap bs

# Function which executes the commands
quickStart() {
    echo "first $1"
    if [ "$react_app" ]&&[ "$typescript" ]; then # React app w/ typescript
        npx create-react-app "$1" --template typescript
    elif [ "$react_app" ]; then # React app wo/ typescript
        npx create-react-app "$1" 
    fi
}

# Ask for proceeding
printf "Preparing to quickstart with: $args\n"
read -n 1 -p "Proceed? [Y/n] " proceed

if [ "$proceed" = "Y" ]; then
    printf "\nProceeding with quickstart\n"
    quickStart $1
elif [ "$proceed" = "n" ]; then
    printf "\nAborting quickstart . . .\n"
    exit 0
else
    printf "\nUnknown input $proceed, aborting\n"
    exit 1
fi
