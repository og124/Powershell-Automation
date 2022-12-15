# Get DNS servers and domain controllers
$DnsServers = Get-DnsClientServerAddress
$DomainControllers = Get-ADDomainController -Filter *

# Output DNS servers and domain controllers in two columns
Write-Output "DNS Servers: $($DnsServers.ServerAddresses)"
Write-Output "Domain Controllers: $($DomainControllers.Name)"
