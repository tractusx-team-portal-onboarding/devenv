#!/bin/sh
[ ! -d "./postgres/data" ] && mkdir ./postgres/data
docker stack deploy -c devenv-localhost.yml devenv
	
