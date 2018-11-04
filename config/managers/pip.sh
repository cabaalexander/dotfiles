#!/bin/bash

__pip(){
  pip3 install --user "$@"
}

# If this file is running in terminal call the function `__pip`
# Otherwise just source it
if [ "$(basename "${0}")" = "pip.sh" ]
then
  __pip "${@}"
fi

