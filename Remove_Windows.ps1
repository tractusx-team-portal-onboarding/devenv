./Shutdown_Windows.ps1
Remove-Item ./nginx/conf/servername.conf
Remove-Item ./postgres/data -Recurse