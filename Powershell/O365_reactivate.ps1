Set-Location "C:\program files\Microsoft office\office16\"
$key = ((( (cscript ospp.vbs /dstatus) | Select-Object -first 1 -skip 13) -split ':')[1]).Trim()
cscript ospp.vbs /unpkey:$key