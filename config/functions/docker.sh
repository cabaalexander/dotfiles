#!/bin/bash

dockerInstall(){
  sudo usermod -a -G docker "$USER"

  for STATE in enable start
  do
      sudo systemctl "$STATE" docker.service
  done

  echo "Reload for the user being added to the group work (;"
}

# If this file is running in terminal call the function `dockerInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "docker.sh" ]
then
  dockerInstall "${@}"
fi

