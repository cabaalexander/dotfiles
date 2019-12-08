#!/bin/bash -e

setzshInstall() {
    local IS_ZSH

    IS_ZSH=$(
        if [ "$(basename "$SHELL")" == "zsh" ]; then
            echo "true"
        fi
    )

    # set zsh as default shell
    if [ -n "$IS_ZSH" ] || ! command -v zsh &>/dev/null; then
        return 0
    fi

    chsh -s "$(grep /zsh$ /etc/shells | tail -1)" <"$G_PASSWORD"
}

# If this file is on the terminal $PATH's just run the function `setzshInstall`
# Otherwise just source it and run
if [ "$(basename "$0")" = "setzsh.sh" ]; then
    setzshInstall "${@}"
fi
