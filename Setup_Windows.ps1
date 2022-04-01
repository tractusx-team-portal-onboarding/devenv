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

# Set environment variables for docker compose file
$env:DEVENV_SERVERNAME = 'devhost'
$env:DEVENV_IP = '172.18.0.2'

# Start docker swarm or do nothing if already running
docker swarm init

# Add entry to hosts
$hostMatches = Get-Content $env:windir\System32\Drivers\etc\hosts | Select-String -Pattern $env:DEVENV_SERVERNAME
if([string]::IsNullOrEmpty($hostMatches))
{
	'Adding entry to hosts file.'
	Add-Content -Path $env:windir\System32\drivers\etc\hosts -Value "`n127.0.0.1 ${env:DEVENV_SERVERNAME}" -Force
}

# Prepare mounted data
if (-not (Test-Path ./postgres/data -PathType Container)) 
{
	'Creating postgres/data directory.'
	mkdir ./postgres/data
}
"server_name $env:DEVENV_SERVERNAME;" | Out-File ./nginx/conf/servername.conf -Encoding ascii

# (Re)deploy docker stack
docker stack rm devenv
docker stack deploy -c devenv.yml devenv

# Wait for input to finish
Write-Host -NoNewLine "Press any key to close ..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")