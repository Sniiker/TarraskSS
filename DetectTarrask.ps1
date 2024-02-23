$tasknames = Get-ScheduledTask -TaskName * | Get-ScheduledTaskInfo | Sort-Object -Property LastRunTime -Descending

foreach($task in $tasknames){
$task
$actions = Get-ScheduledTask -TaskName $task.TaskName | select -ExpandProperty Actions
$actions
$actions.Arguments
$actions.Execute

if($actions.Execute -like "*powershell*"){
write-host "PowerShell Detected" -ForegroundColor Red
}

if($actions.Execute -like "*cmd*"){
write-host "PowerShell Detected" -ForegroundColor Red
}

if($actions.Execute -like "*certutil*"){
write-host "PowerShell Detected" -ForegroundColor Red
}

if($actions.Execute -like "*bitsadmin*"){
write-host "PowerShell Detected" -ForegroundColor Red
}

if($actions.Execute -like "*vssadmin*"){
write-host "PowerShell Detected" -ForegroundColor Red
}

}