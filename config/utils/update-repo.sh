#!/bin/bash -e

main() {
    local repo repo_local_path

    repo=${1:?"Provide a repo URL to clone..."}
    repo_local_path=${2:?"What is the path you want to clone the repo to?"}

    if [ -e "$repo_local_path" ]; then
        return 0
    fi

    git clone "$repo" "$repo_local_path"

    if ! grep "$repo_local_path" .gitignore &> /dev/null; then
        echo "$repo_local_path" >>.gitignore
    fi
}

main "$@"
