$fqdn = [System.Net.Dns]::GetHostByName($env:computerName).HostName
$gateway = (Get-NetRoute "0.0.0.0/0").NextHop
$env:ip = (Test-Connection -ComputerName $env:COMPUTERNAME -Count 1).IPV4Address.IPAddressToStrin

$name = (Read-Host 'Username')
$user = @{
    Name = $name
    SamAccountName = $name.ToLower()
    AccountPassword = (Read-Host -AsSecureString 'Account Password')
    Enabled = $true
}
New-ADUser @user