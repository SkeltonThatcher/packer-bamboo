Describe  'Process checks' {

    Context 'Checking essential Windows processes are running' {

        It 'winlogon.exe is running' {
            get-process -Name 'winlogon' | Should be $true
        }

    }
}