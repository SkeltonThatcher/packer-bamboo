# Download Bamboo
Invoke-WebRequest -URI "http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-6.1.0-windows-x64.exe" -OutFile "C:\Windows\Temp\atlassian-bamboo-6.1.0-windows-x64.exe"

# Silently install Bamboo
C:\Windows\Temp\atlassian-bamboo-6.1.0-windows-x64.exe -q

# Install as a service
Start-Process "cmd.exe" "/c C:\Program Files\Bamboo\install-service.bat"

# Set Creds to local Admin
# Figure out how to get the password
# https://blog.ipswitch.com/working-with-windows-services-in-powershell

# Set to automatic run
Set-Service Bamboo -startuptype "Automatic"
