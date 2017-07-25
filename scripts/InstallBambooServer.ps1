Write-Host "Downloading Bamboo"
Invoke-WebRequest -URI "http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-6.1.0-windows-x64.exe" -OutFile "C:\Windows\Temp\atlassian-bamboo-6.1.0-windows-x64.exe"

Write-Host "Installing Bamboo"
Start-Process C:\Windows\Temp\atlassian-bamboo-6.1.0-windows-x64.exe -ArgumentList "-q" -Wait

Write-Host "Installing Bamboo as a Service"
& "C:\Program Files\Bamboo\InstallAsService.bat"

# Set Creds to local Admin
# Figure out how to get the password
# https://blog.ipswitch.com/working-with-windows-services-in-powershell

Write-Host "Setting Bamboo Service to Automatic startup and then starting"
Set-Service Bamboo -startuptype "Automatic"
Start-Service Bamboo

Write-Host "Adding firewall rule for Bamboo if not present"
If (!(Get-NetFirewallRule -Name "Bamboo Server")) {
    New-NetFirewallRule -Name "Bamboo Server" -Description "Exposes the default port 8085 for Bamboo Server" -DisplayName "Bamboo Server" -Enabled:True -Profile Public -Direction Inbound -Action Allow -Protocol TCP -LocalPort 8085
}
