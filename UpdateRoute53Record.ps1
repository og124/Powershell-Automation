# Install AWS Tools for PowerShell if not already installed
if (-not (Get-Module -Name AWS.Tools.Route53)) {
    Install-Module -Name AWS.Tools.Route53
}

# Set AWS credentials and region
Set-AWSCredentials -AccessKey <YOUR_ACCESS_KEY> -SecretKey <YOUR_SECRET_KEY> -StoreAs <PROFILE_NAME>
Set-DefaultAWSRegion -Region <YOUR_REGION> -ProfileName <PROFILE_NAME>

# Set the DNS record to update
$HostedZoneId = "<YOUR_HOSTED_ZONE_ID>"
$RecordSetName = "<YOUR_RECORD_SET_NAME>"
$RecordSetType = "<YOUR_RECORD_SET_TYPE>"
$RecordSetValue = "<YOUR_RECORD_SET_VALUE>"

# Update the DNS record
Set-R53RecordSet -HostedZoneId $HostedZoneId -RecordSetName $RecordSetName -RecordSetType $RecordSetType -RecordSetValue $RecordSetValue
