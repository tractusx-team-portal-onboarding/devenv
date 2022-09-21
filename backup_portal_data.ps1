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
$BASETABLES='(addresses|offer_assigned_documents|app_languages|agreements|agreement_assigned_offer_types|agreement_assigned_offers|agreement_assigned_company_roles|companies|company_identity_providers|document_templates|identity_providers|iam_identity_providers|agreement_assigned_document_templates|iam_clients|user_roles|user_role_descriptions|app_instances|offer_licenses|offer_assigned_licenses|app_assigned_use_cases|offer_descriptions|company_applications|offer_subscriptions|app_subscription_details|company_assigned_roles|company_assigned_use_cases|company_users|company_user_assigned_app_favourites|company_user_assigned_business_partners|company_user_assigned_roles|documents|consents|iam_users|invitations|connectors|company_service_accounts|notifications|offers|offer_detail_images|offer_tags|consent_assigned_offer_subscriptions|service_provider_company_details)'


#docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t '(business_partners)' --disable-triggers -U portal postgres | awk '$0 ~ /^([^p]|p($|[^g]|g($|[^_]|_($|[^d]|d($|[^u]|u($|[^m]|m($|[^p]|p($|[^:])))))))).*/ { print }' > postgres/init/22-portal-content.sql
docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t $BASETABLES -U portal postgres > postgres/init/22-portal-content.sql
