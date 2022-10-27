#Elevate powershell process to admin

# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole))
{
   # We are running "as Administrator" - so change the title and background color to indicate this
   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
   $Host.UI.RawUI.BackgroundColor = "DarkBlue"
   clear-host
}
else
{
   # We are not running "as Administrator" - so relaunch as administrator

   # Create a new process object that starts PowerShell
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

   # Specify the current script path and name as a parameter
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;

   # Indicate that the process should be elevated
   $newProcess.Verb = "runas";

   # Start the new process
   [System.Diagnostics.Process]::Start($newProcess);

   # Exit from the current, unelevated, process
   exit
}

# Go back to script root directory in elevated process
cd $PSScriptRoot

# Set environment variables for the database
$DEVENV_IP = '172.19.0.2'
$BASETABLES='(addresses|agreement_assigned_company_roles|agreement_assigned_documents|agreement_assigned_offer_types|agreement_assigned_offers|agreements|app_instances|app_languages|audit_company_application20221005|audit_company_user_assigned_role20221005|audit_company_user_assigned_role20221018|audit_company_user20221005|audit_offer_subscription20221005|audit_offer20221013|audit_user_role20221017|companies|company_identity_providers|company_service_accounts|company_role_assigned_role_collections|connectors|consent_assigned_offer_subscriptions|identity_providers|iam_clients|iam_identity_providers|offer_licenses|offer_assigned_licenses|app_assigned_use_cases|offer_descriptions|company_applications|offer_subscriptions|app_subscription_details|company_assigned_roles|company_assigned_use_cases|company_users|company_user_assigned_app_favourites|company_user_assigned_business_partners|company_user_assigned_roles|consents|documents|iam_users|invitations|notifications|offer_assigned_documents|offer_detail_images|offer_tags|offers|service_provider_company_details|user_role_assigned_collections|user_role_collection_descriptions|user_role_collections|user_role_descriptions|user_roles)'

#docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t '(business_partners)' --disable-triggers -U portal postgres | awk '$0 ~ /^([^p]|p($|[^g]|g($|[^_]|_($|[^d]|d($|[^u]|u($|[^m]|m($|[^p]|p($|[^:])))))))).*/ { print }' > postgres/init/22-portal-content.sql
docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump --disable-triggers -h $DEVENV_IP -a -t $BASETABLES -U portal postgres > postgres/init/22-portal-content.sql
