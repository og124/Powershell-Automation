
Login-AzAccount
Get-AzSubscription
Set-AzContext -SubscriptionId "yourSubscriptionID"
# Assuming that the DNS Module is installed in the Modules directory - if not, this command will not run
Import-Module DnsClient

# Define Variables with legitimate info
$RGname="Resource Group Name"
$port=1433
$rulename="Allow SQL Inbound"
$nsgname="Network Security Group Name"

# Resolve FQDN A Record and store as variable
$Dynamic_IP = Resolve-DnsName -Name www.domain.com -Type A -DnsOnly

# Get the Network Security Group resource
$nsg = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $RGname

# Add the inbound security rule for SQL.
$nsg | Set-AzNetworkSecurityRuleConfig -Name $rulename -Description "Allow John SQL Access" -Access Allow `
    -Protocol * -Direction Inbound -Priority 65000 -SourceAddressPrefix $Dynamic_IP -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange $port

# Update the NSG and push from local.
$nsg | Set-AzNetworkSecurityGroup

