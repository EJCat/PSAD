$user = (Read-Host 'Firstname')
$last = (Read-Host 'Lastname')
$user = @{
    Name = $user + ' ' + $last
    GivenName = $user
    SurName = $last
    UserPrincipleName = $user.ToLower() + "." + ($env:USERDNSDOMAIN).ToLower()
    SamAccountName = $user.ToLower()
    AccountPassword = (Read-Host -AsSecureString 'Account Password')
    PasswordNotRequired = $true
    Enabled = $true
}
Import-Module ActiveDirectory
New-ADUser @user