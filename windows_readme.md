# Install local environment (from scratch)
- Run `Setup_Windows.ps1`
- In `Setup_Windows.ps1`, adjust the `$env:DEVENV_IP` value to match the one you can extract from `docker network inspect docker_gwbridge`->Containers->ingress-sbox->IPv4Address value without the mask
- Run `Remove_Windows.ps1`
- Run `Setup_Windows.ps1`

# Start local environment (with configured $env:DEVENV_IP)
- Run `Setup_Windows.ps1`

# Shut down local environment (without deleting any data)
- Run `Shutdown_Windows.ps1`

# Delete local environment (including all keycloak and postgres data)
- Run `Remove_Windows.ps1`