#!/bin/sh
has_wsl=`grep "169.254.254.2 wsl" /etc/hosts`
if [ -z "$has_wsl" ]
then
  echo "run 'sudo ./set_wsl_hosts.sh' first!"
else
  [ ! -d "./postgres/data" ] && mkdir ./postgres/data
  docker stack deploy -c devenv-wsl.yml devenv
fi
