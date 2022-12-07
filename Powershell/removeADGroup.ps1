$users = import-csv C:\csvpath\csvname.csv
Foreach ($user in $users){
Remove-adgroupmember -identity "groupname" -members $user.usernames -Confirm:$false
}