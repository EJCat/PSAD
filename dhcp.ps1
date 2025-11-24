$fqdn = [System.Net.Dns]::GetHostByName($env:computerName).HostName
$gateway = (Get-NetRoute "0.0.0.0/0").NextHop
$env:ip = (Test-Connection -ComputerName $env:COMPUTERNAME -Count 1).IPV4Address.IPAddressToString
Add-DhcpServerInDC -DnsName $fqdn -IPAddress $env:ip

$start = Read-Host "Enter DHCP start range"
$end = Read-Host "Enter DHCP end range"
$scopeid = Read-Host "Enter Scope ID (network ID e.g. 192.168.1.0)"
Add-DhcpServerv4Scope -Name "Network" -StartRange $start -EndRange $end -SubnetMask 255.255.255.0 -state Active

$exstart = Read-Host "Enter DHCP exclusion start range"
$exend = Read-Host "Enter DHCP exclusion end range"
Add-DhcpServerv4ExclusionRange -ScopeId $scopeid -StartRange $exstart -EndRange $exend

Set-DhcpServerv4OptionValue -ScopeId $scopeid -OptionId 6 -Value $env:ip, "8.8.8.8"
Set-DhcpServerv4OptionValue -ScopeId $scopeid -Router $gateway
Set-DhcpServerv4OptionValue -DnsDomain $env:USERDNSDOMAIN -DnsServer $env:ip