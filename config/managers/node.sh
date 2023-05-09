#!/bin/bash

__node() {
	volta install "$@"
}

# If this file is running in terminal call the function `__node`
# Otherwise just source it
if [ "$(basename "${0}")" = "node.sh" ]; then
	__node "${@}"
fi
