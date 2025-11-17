Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -name DHCP -IncludeManagementTools
Install-WindowsFeature -name DNS -IncludeManagementTools

$domain = Read-Host "Enter Domain Root (e.g. fruit.com)"
$netbios = Read-Host "All Caps Name Infront Of .com (e.g. fruit.com -> FRUIT)"

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\WINDOWS\NTDS" `
-DomainMode "Win2025" `
-DomainName $domain `
-DomainNetbiosName $netbios `
-ForestMode "Win2025" `
-InstallDns:$true `
-LogPath "C:\WINDOWS\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\WINDOWS\SYSVOL" `
-Force:$true