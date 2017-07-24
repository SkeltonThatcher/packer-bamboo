
$Results = Invoke-Pester "C:/Windows/Temp/*" -PassThru -OutputFile TestResults.xml -OutputFormat NUnitXml

If ($Results.FailedCount -gt 0) 
{ 
    exit $Results.FailedCount
}
