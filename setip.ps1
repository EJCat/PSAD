Get-NetAdapter
$ifindex = Read-Host "Enter Interface Index"

# NOTE remove queries for Server IP and Gateway
# Should be set manually before running script
Write-Host "Enter Server IP"
$ip = Read-Host " "

Write-Host "Enter Gateway IP"
$gateway = Read-Host " "

Write-Host "Enter Hostname"
$name = Read-Host " "

Disable-NetAdapterBinding -Name "Ethernet0" -ComponentID "ms_tcpip6"
New-NetIPAddress -InterfaceIndex $ifindex -IPAddress $ip -PrefixLength 24 -DefaultGateway $gateway
Set-DnsClientServerAddress -InterfaceIndex $ifindex -ServerAddresses ("127.0.0.1", "8.8.8.8")
Rename-Computer -NewName $name

Get-NetIPConfiguration
Read-Host "Press any button to restart..."
Restart-Computer