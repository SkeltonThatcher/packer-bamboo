Describe  'Bamboo Server installed' {
    It 'Installation directory exists' {
        Test-Path "C:\Program Files\Bamboo" | Should be $true
    }

    It 'Home directory exists' {
        Test-Path "C:\Users\Administrator\Bamboo-home" | Should be $true
    }

    It 'Service exists' {
        Get-Service "bamboo" | Should be $true
    }
}