#!/bin/sh
has_wsl=`grep "169.254.254.2 wsl" /etc/hosts`
if [ -z "$has_wsl" ]
then
  echo "run 'sudo ./set_wsl_hosts.sh' first!"
else
  [ ! -d "./postgres/data" ] && mkdir ./postgres/data
  export DEVENV_SERVERNAME=wsl
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  docker stack deploy -c devenv.yml devenv
fi
