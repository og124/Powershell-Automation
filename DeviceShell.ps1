# Prompt for device IP address, username, and password
$DeviceIP = Read-Host "Enter the IP address of the device"
$Username = Read-Host "Enter the username for the device"
$Password = Read-Host "Enter the password for the device" -AsSecureString

# Connect to the device via SSH
$SshClient = New-Object Renci.SshNet.SshClient($DeviceIP, $Username, $Password)
$SshClient.Connect()

# Create a shell for entering commands
$Shell = $SshClient.CreateShellStream("Terminal", 0, 0, 0, 0, 1024)

# Read commands from the shell and send them to the device
$Commands = $Shell.Read()
while($Commands -ne "quit") {
    $Shell.WriteLine($Commands)
    $Commands = $Shell.Read()
}

# Disconnect from the device
$SshClient.Disconnect()
