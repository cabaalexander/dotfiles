#!/bin/bash -e

setzshInstall() {
    local IS_ZSH PASS

    IS_ZSH=$(
        if [ "$(basename "$SHELL")" == "zsh" ]; then
            echo "true"
        fi
    )

    # set zsh as default shell
    if [ -n "$IS_ZSH" ]; then
        echo "You have zsh already set"
        return 0
    elif ! command -v zsh &>/dev/null; then
        echo "You do not have zsh installet m8..."
        return 0
    fi

    # set zsh as default shell
    if ! [ -f "$G_PASSWORD" ]; then
        G_PASSWORD=$(mktemp)
        read -rsp "Sudo password: " PASS
        echo "$PASS" > "$G_PASSWORD"
    fi

    chsh -s "$(grep /zsh$ /etc/shells | tail -1)" <"$G_PASSWORD"
}

# If this file is on the terminal $PATH's just run the function `setzshInstall`
# Otherwise just source it and run
if [ "$(basename "$0")" = "setzsh.sh" ]; then
    setzshInstall "${@}"
fi
