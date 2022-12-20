#TODO: Add error capture and error-specific messages
$csv = import-csv "source path.csv"
foreach ($user in $csv)
{
	$name = $user.name
	Add-ADGroupMember -Identity "groupName" -Members $name -confirm:$false
}
