#!/usr/bin/env bash
# Quickstart
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence


#######################################
# Configure Eslint
# Globals:
#   None
# Arguments:
#   eslint: boolean
#   typescript: boolean
#######################################
getEslint() {
    if "$1"; then
        printf ""
    else
        printf "\t\033[0;93mEslint not requested\033[0m\n"
    fi
}
