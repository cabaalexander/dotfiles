#!/bin/bash

linuxOsInstall(){
  # Set TimeZone to America/Santo_Domingo
  echo "[Setting Timezone]"
  sudo timedatectl set-timezone America/Santo_Domingo

  echo "[Installing] Apps"
  iterateOver "${LINUX}" redirectToPath appInstall

  echo "[Installing] PPAs"
  iterateOver "${PPA}" redirectToPath addPPA

  echo "[Updating APT]"
  redirectToPath updateAPT

  echo "[Installing] Apps"
  iterateOver "${AFTER_PPA}" redirectToPath appInstall

  echo "[Installing] NVM ${NVM}"
  redirectToPath nvmInstall

  echo "[Installing] Ruby ${RUBY}"
  redirectToPath rvmInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

