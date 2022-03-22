#!/bin/sh
[ ! -d "./postgres/data" ] && mkdir ./postgres/data
export DEVENV_SERVERNAME=localhost
export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
docker stack deploy -c devenv.yml devenv
	
