$group = read-host -Prompt "Enter Group Name"
get-adgroupmember -identity $group | Select-Object name | export-CSV C:\temp\$group.csv