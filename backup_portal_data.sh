#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  TABLES='(addresses|companies|identity_providers|company_identity_providers|iam_identity_providers|apps|app_detail_images|app_tags|app_languages|agreements|agreement_assigned_apps|agreement_assigned_company_roles|document_templates|agreement_assigned_document_templates|iam_clients|user_roles|user_role_descriptions|app_instances|app_licenses|app_assigned_licenses|app_assigned_use_cases|app_descriptions|company_applications|company_assigned_apps|company_assigned_roles|company_assigned_use_cases|company_users|company_user_assigned_app_favourites|company_user_assigned_business_partners|company_user_assigned_roles|documents|consents|iam_users|invitations|connectors|company_service_accounts|notifications|app_assigned_documents)'
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
#    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t '(business_partners)' --disable-triggers -U portal postgres | awk '$0 ~ /^([^p]|p($|[^g]|g($|[^_]|_($|[^d]|d($|[^u]|u($|[^m]|m($|[^p]|p($|[^:])))))))).*/ { print }' > postgres/init/22-portal-content.sql
    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t $TABLES -U portal postgres >> postgres/init/22-portal-content.sql
  fi
fi

