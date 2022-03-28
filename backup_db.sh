#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
    docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -n iamcentral -U postgres postgres > postgres/init/10-iamcentral.sql
    docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -n iamshared -U postgres postgres > postgres/init/11-iamshared.sql
    docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -n portal -U postgres postgres > postgres/init/12-portal.sql
    docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -n provisioning -U postgres postgres > postgres/init/13-provisioning.sql
  fi
fi

