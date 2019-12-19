#!/bin/bash -e

rustInstall() {
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
}

# If this file is on the terminal $PATH's just run the function `rustInstall`
# Otherwise just source it and run
if [ "$(basename "$0")" = "rust.sh" ]; then
    rustInstall "${@}"
fi
