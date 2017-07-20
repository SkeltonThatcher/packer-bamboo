$EC2SettingsFile="C:\\Program Files\\Amazon\\Ec2ConfigService\\Settings\\Config.xml"
$xml = [xml](get-content $EC2SettingsFile)
$xmlElement = $xml.get_DocumentElement()
$xmlElementToModify = $xmlElement.Plugins

$enableElements = "Ec2SetPassword", `
                  "Ec2SetComputerName", `
                  "Ec2HandleUserData", `
                  "Ec2DynamicBootVolumeSize"

$xmlElementToModify.Plugin | Where-Object {$enableElements -contains $_.name} | Foreach-Object {$_.State="Enabled"}

$xml.Save($EC2SettingsFile)
