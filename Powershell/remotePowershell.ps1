$TargetMachine = Read-Host "Which computer do you want to remote into?"
$cred=Get-Credential
$sess = New-PSSession -Credential $cred -ComputerName $TargetMachine
Enter-PSSession $sess
<Run commands in remote session>
Exit-PSSession
Remove-PSSession $sess 