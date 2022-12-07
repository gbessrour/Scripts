$csv = import-csv "sourcepath.csv"
foreach ($user in $csv)
{
	$name = $user.name
	Remove-ADGroupMember -Identity "groupname" -Members $name -confirm:$false
}