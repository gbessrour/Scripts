$regKey = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'
# create the key if it doesn't already exist
if (!(Test-Path -Path $regKey)) {
    $null = New-Item -Path $regKey
}

# now set the registry entry
Set-ItemProperty -Path $regKey -Name LockScreenImage -Value '<path>'