#!/usr/bin/env bash
# Quickstart | Bootstrap functions
# Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

#######################################
# Create react app
# Globals:
#   none
# Arguments:
#   bootstrap: boolean
#######################################
getBootstrap() {
    if "$1"; then # If Bootstrap was requested
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
            printf "\t\033[0;94mCreating new make commands sass and sass-min...\033[0m\n"
            printf "sass:\n\tsass ./scss/bootstrap.scss ./public/css/styles.css\n\nsass-min:\n\tsass ./scss/bootstrap.scss ./public/css/styles.css --style compressed\n" >> makefile # Make sass compiling make commands
            make # Compile sass as-is
            printf "\t\033[0;92mMake commands created and executed!\033[0m\n"
        fi
        
        printf "\033[0;92mInstalled Bootstrap!\033[0m\n"
    else
        printf "\t\033[0;93mBootstrap not requested\033[0m\n"
    fi
}
