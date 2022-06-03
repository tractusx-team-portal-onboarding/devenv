#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  BASETABLES='(agreement_categories|app_statuses|company_application_statuses|company_role_descriptions|company_roles|company_statuses|company_user_statuses|consent_statuses|countries|document_types|identity_provider_categories|invitation_statuses|languages|use_cases|connector_statuses|connector_types|company_service_account_statuses|app_subscription_statuses)'
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
    docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -n portal -s -O -U postgres postgres > postgres/init/20-portal.sql
    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t $BASETABLES -U portal postgres > postgres/init/21-portal-basedata.sql
    docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -t '__efmigrations_history*' -U postgres postgres > postgres/init/90-public-efhistory.sql
  fi
fi

