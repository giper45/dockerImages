#!/bin/bash

set -e
#./init.sh

hex()
{
  openssl rand -hex 8
}
echo 'Creating shellinabox user '


echo "Preparing container .."

COMMAND="./shellinaboxd --debug --no-beep -u kali -g kali -p ${SIAB_PORT}" 


if [ "$SIAB_SSL" != "true" ]; then
  COMMAND+=" -t"
fi

if [ "${SIAB_ADDUSER}" == "true" ]; then
  sudo=""
  if [ "${SIAB_SUDO}" == "true" ]; then
    echo 'sudo mode ON';	 
    sudo="-G sudo"
  fi
  if [ -z "$(getent group ${SIAB_GROUP})" ]; then
    /usr/sbin/groupadd -g ${SIAB_GROUPID} ${SIAB_GROUP}
  fi
  if [ -z "$(getent passwd ${SIAB_USER})" ]; then
     echo 'ADD USER ${SIAB_USER}' 
    /usr/sbin/useradd -u ${SIAB_USERID} -g ${SIAB_GROUPID} -s ${SIAB_SHELL} -d ${SIAB_HOME} -m ${sudo} ${SIAB_USER}
    if [ "${SIAB_PASSWORD}" == "putsafepasswordhere" ]; then
      SIAB_PASSWORD=$(hex)
      echo "Autogenerated password for user ${SIAB_USER}: ${SIAB_PASSWORD}"
    fi
    echo "${SIAB_USER}:${SIAB_PASSWORD}" | /usr/sbin/chpasswd
    unset SIAB_PASSWORD
  fi
fi

for service in ${SIAB_SERVICE}; do
  COMMAND+=" -s ${service}"
done


echo "Starting container .."
if [[ "$@" == "shellinabox" ]]; then
  echo "Executing: ${COMMAND}"
  cd /tmp; 
  exec ${COMMAND}
else
  echo "Not executing: ${COMMAND}"
  echo "Executing: ${@}"
  exec $@
fi
