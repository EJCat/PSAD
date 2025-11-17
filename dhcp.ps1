$fqdn = $($env:COMPUTERNAME).$($env:USERDNSDOMAIN)
$env:ip = (Test-Connection -ComputerName $env:COMPUTERNAME -Count 1).IPV4Address.IPAddressToString
Add-DhcpServerInDC -DnsName $fqdn -IPAddress $env:ip