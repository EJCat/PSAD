$user = (Read-Host 'Firstname')
$last = (Read-Host 'Lastname')
$user = @{
    Name = $user + ' ' + $last
    GivenName = $user
    SurName = $last
    UserPrincipalName = $user.ToLower() + "." + ($env:USERDNSDOMAIN).ToLower()
    SamAccountName = $user.ToLower()
    PasswordNotRequired = $true
    AccountPassword = (Read-Host -AsSecureString 'Account Password')
    Enabled = $true
}
Import-Module ActiveDirectory
New-ADUser @user