#Enter a path to your import CSV file
$ADUsers = Import-csv C:\scripts\newusers.csv

foreach ($User in $ADUsers)
{
        $Username        = $User.username
        $Password        = $User.password
        $Firstname       = $User.firstname
        $Lastname        = $User.lastname
        $Department      = $User.department
        $OU              = $User.ou
        $Title           = $User.title
        $Manager         = $User.manager
        $Company         = "CentralSquare"
        $BasePermissions = $User.basePermissions

       #Check if the user account already exists in AD
       if (Get-ADUser -F {SamAccountName -eq $Username})
       {
               #If user does exist, output a warning message
               Write-Warning "A user account $Username has already exist in Active Directory."
       }
       else
       {
              #If a user does not exist then create a new user account
          
        #Account will be created in the OU listed in the $OU variable in the CSV file; don’t forget to change the domain name in the"-UserPrincipalName" variable
              New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@centralsquare.com" `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -ChangePasswordAtLogon $False `
            -DisplayName "$Firstname $Lastname" `
            -Description "$Title" `
            -Manager $Manager `
            -Department $Department `
            -Path $OU `
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force)
       }
       
       get-aduser -identity $BasePermissions -properties memberof | Select-object -ExpandProperty memberof | Add-ADGroupMember -Members $Username
}