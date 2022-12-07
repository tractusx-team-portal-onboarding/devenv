#!/bin/sh
if [ -z $1 ]; then
  echo "parameter 'hostname' missing";
else
  export DEVENV_SERVERNAME=$1
  export DEVENV_IP=`getent hosts $DEVENV_SERVERNAME | awk '{ print $1 }'`
  TABLES='(addresses|agreement_assigned_company_roles|agreement_assigned_documents|agreement_assigned_offer_types|agreement_assigned_offers|agreements|app_instances|app_languages|audit_app_subscription_detail20221118|audit_company_application20221005|audit_company_user_assigned_role20221005|audit_company_user_assigned_role20221018|audit_company_user20221005|audit_offer_subscription20221005|audit_offer20221013|audit_user_role20221017|companies|company_identity_providers|company_service_accounts|company_role_assigned_role_collections|connectors|consent_assigned_offer_subscriptions|identity_providers|iam_clients|iam_identity_providers|offer_licenses|offer_assigned_licenses|app_assigned_use_cases|offer_descriptions|company_applications|offer_subscriptions|app_subscription_details|company_assigned_roles|company_assigned_use_cases|company_users|company_user_assigned_app_favourites|company_user_assigned_business_partners|company_user_assigned_roles|consents|documents|iam_users|invitations|notifications|offer_assigned_documents|offer_detail_images|offer_tags|offers|provider_company_details|service_assigned_service_types|user_role_assigned_collections|user_role_collection_descriptions|user_role_collections|user_role_descriptions|user_roles)'
  if [ -z "$DEVENV_IP" ]; then
    echo "hostname $DEVENV_SERVERNAME unknown (run 'sudo ./set_wsl_hosts.sh' resp. 'sudo ./set_devhost_hosts.sh' first)"
  else
    docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump --disable-triggers -h $DEVENV_IP -a -t $TABLES -U portal postgres | awk '$0 ~ /^([^p]|p($|[^g]|g($|[^_]|_($|[^d]|d($|[^u]|u($|[^m]|m($|[^p]|p($|[^:])))))))).*/ { print }' > postgres/init/22-portal-content.sql
    docker run -it --rm -e PGPASSWORD=pwprovisioning postgres pg_dump -h $DEVENV_IP -n provisioning -a -U provisioning postgres > postgres/init/31-provisioning-data.sql
  fi
fi
