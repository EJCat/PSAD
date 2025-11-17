Get-NetAdapter
Write-Host "Enter Interface Index"
$ifindex = Read-Host " "

Write-Host "Enter Server IP"
$ip = Read-Host " "

Write-Host "Enter Gateway IP"
$gateway = Read-Host " "

Write-Host "Enter Hostname"
$name = Read-Host " "

New-NetIPAddress -InterfaceIndex $ifindex -IPAddress $ip -PrefixLength 24 -DefaultGateway $gateway
Set-DnsClientServerAddress -InterfaceIndex $ifindex -ServerAddresses ("127.0.0.1", "8.8.8.8")
Rename-Computer -NewName $name
Restart-Computer