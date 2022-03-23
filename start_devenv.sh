#!/bin/bash
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
    if [ -a "nginx/certs/$DEVENV_SERVERNAME.crt" ] && [ -a "nginx/certs/$DEVENV_SERVERNAME.key" ]; then
      [ ! -d "postgres/data" ] && mkdir postgres/data
      echo "server_name $DEVENV_SERVERNAME;" > nginx/conf/servername.conf
      docker stack deploy -c devenv.yml devenv
    else
      echo "nginx/certs/$DEVENV_SERVERNAME.crt or nginx/certs/$DEVENV_SERVERNAME.key are missing!"
    fi
  fi
fi

