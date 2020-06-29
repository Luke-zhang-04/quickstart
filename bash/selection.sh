#!/usr/bin/env bash
# Quickstart | Menu selection functions
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get location of this script
. "${DIR}/colours.sh"

# Array of all options
options=()

# Current option
index=0

# Selected options
selected=()

#######################################
# Checks parameters and returns their existence
# Globals:
#   selected: string[] - selected options from selection menu
#   options: string[] - all options
# Arguments:
#   full arg name
#######################################
checkOptions() { # Check passed in arguments and match them
    for arg in "${selected[@]}"; do
        if [[ "${options[arg]}" == "$1" ]]; then
            printf true
            return 0
        fi
    done
    printf false
    return 1
}

#######################################
# Checks parameters and returns their existence
# Globals:
#   selected: string[] - selected options from selection menu
#   options: string[] - all options
# Arguments:
#   none
#######################################
showSelected() { # Check passed in arguments and match them
    selectedNames=()

    for arg in "${selected[@]}"; do
        selectedNames+=( ${options[arg]} )
    done
    printf "${selectedNames[*]}"
}

#######################################
# Menu function with selectors
# Globals:
#   options: string[] - array of key values pairs, seperated by a colon
# Arguments:
#   input: stirng - last input
#######################################
displayMenu() {
    if [[ "$1" == "A" ]]; then # Up keystroke
        if [[ "$index" != 0 ]]; then
            ((index-=1))
        fi

    elif [[ "$1" == "B" ]]; then # Down keysroke
        if [[ "$index" -lt "${#options[@]}" ]]; then
            ((index+=1))
        fi

    elif [[ "$1" == "" ]]; then # Enter or space pressed
        if [[ "${selected[@]}" =~ "$index" ]]; then # If array contiains index
            delete="$index"
            selected=( "${selected[@]/$delete}" ) # Delete index from array
        else
            selected+=( "$index" )
        fi

    fi

    clear

    printf "${BICyan}Navagate options with arrow keys, press enter or space to select, and submit with the submit option.${Cyan}\n\n"

    count=0
    for option in "${options[@]}"; do

        if [[ "$count" == "$index" ]]&&[[ "${selected[@]}" =~ "$count" ]]; then # Selected and is pn
            printf "${BIPurple}❯◉ $option${Cyan}\n"

        elif [[ "${selected[@]}" =~ "$count" ]]; then # Selected
            printf "${BIGreen} ◉ $option${Cyan}\n"

        elif [[ "$count" == "$index" ]]; then # Is on
            printf "${BIBlue}❯◯ $option${Cyan}\n"

        else
            printf "${Cyan} ◯ $option${Cyan}\n" # Not selected and is not on
        fi

        ((count+=1))
    done

    if [[ "${#options[@]}" == "$index" ]]; then
        printf "\n${BIBlue}❯Submit${Cyan}\n"
    else
        printf "\n${IGreen} Submit${Cyan}\n"
    fi
}

#######################################
# Menu function with selectors
# Globals:
#   none
# Arguments:
#   scripts: string[] - array of all possible options
#######################################
menu() {
    for script in "$@"; do
        options+=( "$script" )
    done

    displayMenu "A"

    while true; do
        read -rsn1 input
        
        displayMenu "$input"

        if [[ "${selected[@]}" =~ "${#options[@]}" ]]; then
            printf "\n\n"
            delete="${#options[@]}"
            selected=( "${selected[@]/$delete}" ) # Delete index from array
            break
        fi
    done
}
