Describe  'Bamboo Server installation' {
    It 'creates the installation directory' {
        Test-Path "C:\Program Files\Bamboo" | Should be $true
    }

    It 'creates the Home directory' {
        Test-Path "C:\Users\Administrator\Bamboo-home" | Should be $true
    }

    It 'sets up the Service' {
        Get-Service "bamboo" | Should be $true
    }

    It 'creates the inbound firewall rule' {
        Get-NetFirewallRule -Name "Bamboo Server" | Should Not BeNullOrEmpty
    }
}