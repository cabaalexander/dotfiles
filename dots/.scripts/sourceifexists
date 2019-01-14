#!/bin/bash
# shellcheck disable=1090,1117,2155

__source_glob(){
    for TARGET in "${@:?No files to be sourced...}"
    do
        local TARGET_BASENAME=$(basename "$TARGET")
        local IS_IGNORED=$(grep -E "\b$TARGET_BASENAME\b" <<< "${IGNORED_FILES[*]}" 2> /dev/null)

        [[ "$IS_IGNORED" ]] && continue


        [ -f "$TARGET" ] && source "$TARGET"
    done
}

sourceIfExists(){ # Source file if exists (glob pattern)
    local IGNORED_FILES=(
        .bash_profile
        .bash_history
        .bash_logout
        Session.vim
    )

    while getopts ":i:" OPT
    do
        case $OPT in
            i)
                IGNORED_FILES+=("$OPTARG")
                ;;
            \?)
                echo "Invalid option (-$OPTARG)"
                ;;
        esac
    done
    shift $((OPTIND-1))

    __source_glob "$@"
}

