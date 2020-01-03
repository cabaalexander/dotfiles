#!/bin/bash -e

destroy_paths() {
    local file

    file=${1:?"File not provided..."}

    test -e "$file" || return 0

    while read -rs path ; do
        rm -rf "$path"
        echo "Destroyed: $path"
    done < "$file"

    rm -rf "$file"
}

# If this file is on the terminal $PATH's just run the function `destroy-paths`
# Otherwise just source it and run
if [ "$(basename "$0")" = "destroy-paths.sh" ]; then
    destroy_paths "${@}"
fi
