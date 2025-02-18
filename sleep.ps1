$WShell = New-Object -com "Wscript.Shell"
while ($true)
{
$date = Get-Date
Write-Host $date #-f "yyyyMMdd"

$WShell.sendkeys("{SCROLLLOCK}")
Start-Sleep -Milliseconds 100
$WShell.sendkeys("{SCROLLLOCK}")
Start-Sleep -Seconds 170
}
