Describe  'Dev Tools Installer' {
    It 'installs Framework .Net 4.5.2 or newer' {
        Test-Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" | Should be $true

        $key = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full"
        $key.Release | Should BeGreaterThan 378758 #378758 is .net 4.5.1
    }

    It 'ensure MSBuild 14 is present at the expected location' {
        Test-Path "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" | Should be $true
    }
}