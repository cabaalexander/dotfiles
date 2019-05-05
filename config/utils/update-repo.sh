#!/bin/bash
set -Eeuo pipefail

# TODO: add the new repo to the .gitignore if not already in

main(){
    local repo repo_local_path

    repo=$1
    repo_local_path=$2

    if ! [ -e "$repo_local_path" ]; then
        git clone "$repo" "$repo_local_path"
    fi
}

main "$@"
