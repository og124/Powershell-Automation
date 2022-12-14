# Get the current network adapter configuration
$adapter = Get-NetAdapter

# Check if the adapter is currently on wired Ethernet
if ($adapter.InterfaceType -eq 'Ethernet') {
    # Set the adapter to use wireless
    $adapter | Set-NetAdapter -InterfaceType Wireless
} else {
    # Set the adapter to use wired Ethernet
    $adapter | Set-NetAdapter -InterfaceType Ethernet
}
