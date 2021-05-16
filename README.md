# Powershell-Automation
Repo of useful Powershell scripts (including Azure Powershell) related to Network Engineering and Automation.

# 1. FQDN-NSG (Azure Powershell)
This Azure Powershell script was made to emulate an inbound FQDN rule in an Azure Network Security Group. As this feature is not currently available within Azure this script resolves a defined FQDN and stores its IP address as a variable named $Dynamic_IP, and in turn connects to a pre-existing NSG rule config to update the "-SourceAddressPrefix" value with the stored variable. This script would need to be scheduled with an Azure Automation account to ensure that it is run on a frequent basis should the DNS record change. I wrote this code (with Microsoft Documentation) for a DDNS home public IP scenario as a workaround for Azure server access.
