#!/usr/bin/env bash

args="$*"

checkParams() {
    if [[ $args == *"$2"* ]]; then
        eval $1=true
    elif [[ $args == *"$3"* ]]&&[["$3"]]; then
        eval $1=true
    else 
        eval $1=false
    fi
}

checkParams react_app react
checkParams typescript typescript ts
checkParams eslint eslint
checkParams bootstrap bootstrap bs

echo "$react_app" "$typescript" "$eslint" "$bootstrap"
