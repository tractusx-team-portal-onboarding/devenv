#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
  exit;
fi
if [ -z $2 ]; then
  echo "parameter 'filename' missing";
  exit;
fi
export DEVENV_SERVERNAME=$1
export FILENAME=$2
export PGUSER=provisioning
export PGPASSWORD=pwprovisioning
exec ./import_db.sh

