#!/bin/sh
if [ -z "$DEVENV_SERVERNAME" ]; then echo "no servername specified"; exit; fi
DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
if [ -z "$DEVENV_IP" ]; then echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"; exit; fi
if [ -z "$FILENAME" ]; then echo "filename not specified"; exit; fi
if [ -z "$PGUSER" ]; then echo "PGUSER not set"; exit; fi
if [ -z "$PGPASSWORD" ]; then echo "PGPASSWORD not set"; exit; fi
if [ ! -f "$FILENAME" ]; then echo "file $FILENAME not found"; exit; fi
cat $FILENAME | docker run -i --rm -e PGPASSWORD=$PGPASSWORD postgres psql -h $DEVENV_IP -U $PGUSER postgres

