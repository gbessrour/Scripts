$User = read-host -Prompt "Enter Users Primary SMTP address"

$filename = read-host -Prompt "Enter the CSV file name"

$Mailbox=get-Mailbox $User

$DN=$mailbox.DistinguishedName

$Filter = "Members -like ""$DN"""
	
Get-DistributionGroup -ResultSize Unlimited -Filter $Filter |export-CSV C:\temp\$filename.csv