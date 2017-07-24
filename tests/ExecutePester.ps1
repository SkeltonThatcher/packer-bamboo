
$Results = Invoke-Pester -PassThru

If ($Results.FailedCount -gt 0) 
{ 
    exit $Results.FailedCount
}
