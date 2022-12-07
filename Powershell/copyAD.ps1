$source = read-host -Prompt "Enter the source user"
$target = read-host -Prompt "Enter the target user"
get-aduser -identity $source -properties memberof | Select-object -ExpandProperty memberof | Add-ADGroupMember -Members $target
