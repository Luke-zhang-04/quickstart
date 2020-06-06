#!/usr/bin/env bash

args="$*" # Passed in arguments

checkParams() { # Check passed in arguments and match them
    if [[ $args == *"$2"* ]]; then
        eval "$1"=true
    elif [[ $args == *"$3"* ]]&&[[ "$3" ]]; then
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

#######################################
# Create react app
# Globals:
#   react_app
#   typescript
# Arguments:
#   None
#######################################
reactApp() {
    if [ "$react_app" ]&&[ "$typescript" ]; then # React app w/ typescript
        # npx create-react-app client --template typescript # Create React app named client, with typescript template
        # cd client # cd into client
        echo "WOAH! REACT WITH TYPESCRIPT"
    elif [ "$react_app" ]; then # React app wo/ typescript
        # npx create-react-app client # Create React app names client
        # cd client # cd into client
        echo "WOAH! REACT WITH NO TYPESCRIPT"
    fi
}



# Function which executes the commands
quickStart() {
    # Clone the quickstart Gist. Check this Gist for malicious code first, in case you don't trust me (don't trust anyone).
    git clone https://gist.github.com/d4c19d39f0a462fc79e0b3361752cf95.git
    mv d4c19d39f0a462fc79e0b3361752cf95 quickstart # Change name to quickstart

    mv ./quickstart/.gitignore ./.gitignore # Get .gitignore from quickstart

    reactApp

    if [ "$bootstrap" ]; then # If Bootstrap was requested
        yarn add bootstrap

    rm -rf ./quickstart # Get rid of quickstart
}

# Ask for proceeding
printf "Preparing to quickstart with: $args\n"
read -n 1 -p "Proceed? [Y/n] " proceed

if [ "$proceed" = "Y" ]; then
    printf "\nProceeding with quickstart\n"
    quickStart
    exit 0
elif [ "$proceed" = "n" ]; then
    printf "\nAborting quickstart . . .\n"
    exit 0
else
    printf "\nUnknown input $proceed, aborting\n"
    exit 1
fi
