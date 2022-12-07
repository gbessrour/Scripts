Write-Host "Enter the login credentials of the O365 tenant you want to log into."
$credential = get-credential

Write-Host "Connecting to MsOnline..."
TRY{
	Import-Module MsOnline
}
CATCH{
	Install-Module MsOnline
	Import-Module MsOnline
}
Connect-MsolService -Credential $credential

Write-Host "Connecting to Exchange online..."
$so = New-PSSessionOption -IdleTimeout 600000
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection -SessionOption $so
Import-PSSession $exchangeSession -DisableNameChecking -AllowClobber

<#
Write-Host "Connecting to SharePoint online..."
TRY{
	Import-Module Microsoft.Online.SharePoint.PowerShell
}
CATCH{
	Install-Module Microsoft.Online.SharePoint.PowerShell
	Import-Module Microsoft.Online.SharePoint.PowerShell
}
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking -Verbose
Connect-SPOService -Url https://superionllc-admin.sharepoint.com -credential $credential

Write-Host "Connecting to Skype online..."
TRY{
	Import-Module SkypeOnlineConnector
}
CATCH{
	Install-Module SkypeOnlineConnector
	Import-Module SkypeOnlineConnector
}
$sfboSession = New-CsOnlineSession -Credential $credential
Import-PSSession $sfboSession -AllowClobber

Write-Host "Connecting to Security and Compliance center..."
$ccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $ccSession -AllowClobber
#>