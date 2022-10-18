#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  TABLES='(addresses|agreement_assigned_document_templates|agreement_assigned_offer_types|agreement_assigned_offers|agreement_assigned_company_roles|agreements|app_instances|app_languages|audit_company_application20221005|audit_company_user_assigned_role20221005|audit_company_user_assigned_role20221018|audit_company_user20221005|audit_offer_subscription20221005|audit_offer20221013|audit_user_role20221017|companies|company_identity_providers|company_service_accounts|connectors|consent_assigned_offer_subscriptions|document_templates|identity_providers|iam_clients|iam_identity_providers|user_role_descriptions|user_roles|offer_licenses|offer_assigned_licenses|app_assigned_use_cases|offer_descriptions|company_applications|offer_subscriptions|app_subscription_details|company_assigned_roles|company_assigned_use_cases|company_users|company_user_assigned_app_favourites|company_user_assigned_business_partners|company_user_assigned_roles|consents|documents|iam_users|invitations|notifications|offer_assigned_documents|offer_detail_images|offer_tags|offers|service_provider_company_details)'
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
#    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t '(business_partners)' --disable-triggers -U portal postgres | awk '$0 ~ /^([^p]|p($|[^g]|g($|[^_]|_($|[^d]|d($|[^u]|u($|[^m]|m($|[^p]|p($|[^:])))))))).*/ { print }' > postgres/init/22-portal-content.sql
    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t $TABLES -U portal postgres > postgres/init/22-portal-content.sql
  fi
fi

