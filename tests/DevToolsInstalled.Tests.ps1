Describe  'Dev Tools installation' {
    It 'installs nuget' {
        { Get-Command "nuget.exe" -ErrorAction Stop } | Should Not Throw
    }

    It 'installs nunit' {
        { Get-Command "nunit3-console.exe" -ErrorAction Stop } | Should Not Throw
    }

    It 'installs git' {
        { Get-Command "git" -ErrorAction Stop } | Should Not Throw
    }
}