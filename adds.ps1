Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -name DHCP -IncludeManagementTools
Install-WindowsFeature -name DNS -IncludeManagementTools

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