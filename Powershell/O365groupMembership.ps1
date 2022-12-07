# Get all the users in an O365 group and get their attributes
$GroupName = Read-Host "Enter the group name"
$Path = Read-Host "Where do you want the results saved?"
$Members = Get-UnifiedGroupLinks -Identity $GroupName -LinkType Member
	$data = @()
	$members | %{
	    $ADuser = $NULL
	    $ADuser = Get-ADuser -Identity $($_.WindowsLiveID -Replace '@centralsquare.com','') -Properties *
	    IF($ADuser -ne $NULL){
	        $data += $ADuser
	    }
	}
	$data | Sort Name | Select Name,Extension* | Export-CSV "$Path\$GroupName.csv"
