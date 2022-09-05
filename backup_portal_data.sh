#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  TABLES='(addresses|app_assigned_documents|app_languages|agreements|agreement_assigned_company_roles|companies|company_identity_providers|document_templates|identity_providers|iam_identity_providers|agreement_assigned_document_templates|iam_clients|user_roles|user_role_descriptions|app_subscription_details|app_instances|offer_licenses|offer_assigned_licenses|app_assigned_use_cases|offer_descriptions|company_applications|offer_subscriptions|company_assigned_roles|company_assigned_use_cases|company_users|company_user_assigned_app_favourites|company_user_assigned_business_partners|company_user_assigned_roles|documents|consents|iam_users|invitations|connectors|company_service_accounts|notifications|offers|offer_detail_images|offer_tags)'
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
#    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t '(business_partners)' --disable-triggers -U portal postgres | awk '$0 ~ /^([^p]|p($|[^g]|g($|[^_]|_($|[^d]|d($|[^u]|u($|[^m]|m($|[^p]|p($|[^:])))))))).*/ { print }' > postgres/init/22-portal-content.sql
    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t $TABLES -U portal postgres >> postgres/init/22-portal-content.sql
  fi
fi

