$csv = import-csv "source path.csv"
foreach ($user in $csv)
{
	$name = $user.name
	Add-ADGroupMember -Identity "groupName" -Members $name -confirm:$false
}