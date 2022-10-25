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
$BASETABLES='(agreement_categories|audit_operation|company_application_statuses|company_role_descriptions|company_role_registration_data|company_roles|company_service_account_statuses|company_statuses|company_user_statuses|connector_statuses|connector_types|consent_statuses|countries|document_types|document_status|identity_provider_categories|invitation_statuses|languages|notification_type|offer_subscription_statuses|offer_statuses|offer_types|use_cases)'

docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -n portal -s -O -U postgres postgres > postgres/init/20-portal.sql
docker run -it --rm -e PGPASSWORD=pwportal postgres pg_dump -h $DEVENV_IP -a -t $BASETABLES -U portal postgres > postgres/init/21-portal-basedata.sql
docker run -it --rm -e PGPASSWORD=pwpostgres postgres pg_dump -h $DEVENV_IP -t '__efmigrations_history*' -U postgres postgres > postgres/init/90-public-efhistory.sql

# Wait for input to finish
Write-Host -NoNewLine "Press any key to close ..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")