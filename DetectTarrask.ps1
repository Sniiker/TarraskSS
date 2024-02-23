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





# Ruta del archivo de texto de salida en el directorio actual
$txtFilePath = Join-Path -Path $PWD -ChildPath "resultados_tareas.txt"

# Obtener las tareas programadas y sus acciones
$tasknames = Get-ScheduledTask -TaskName * | Get-ScheduledTaskInfo | Sort-Object -Property LastRunTime -Descending

# Abrir o crear el archivo de texto para escritura
$textFile = [System.IO.StreamWriter]::new($txtFilePath)

# Recorrer las tareas programadas y sus acciones
foreach ($task in $tasknames) {
    $task | Out-File -FilePath $txtFilePath -Append
    $actions = Get-ScheduledTask -TaskName $task.TaskName | Select-Object -ExpandProperty Actions
    $actions | Out-File -FilePath $txtFilePath -Append
    $actions.Arguments | Out-File -FilePath $txtFilePath -Append
    $actions.Execute | Out-File -FilePath $txtFilePath -Append

    if ($actions.Execute -like "*powershell*") {
        "PowerShell Detected" | Out-File -FilePath $txtFilePath -Append
    }

    if ($actions.Execute -like "*cmd*") {
        "PowerShell Detected" | Out-File -FilePath $txtFilePath -Append
    }

    if ($actions.Execute -like "*certutil*") {
        "PowerShell Detected" | Out-File -FilePath $txtFilePath -Append
    }

    if ($actions.Execute -like "*bitsadmin*") {
        "PowerShell Detected" | Out-File -FilePath $txtFilePath -Append
    }

    if ($actions.Execute -like "*vssadmin*") {
        "PowerShell Detected" | Out-File -FilePath $txtFilePath -Append
    }

    # Agregar un separador entre cada tarea para facilitar la lectura del archivo de texto
    "---" | Out-File -FilePath $txtFilePath -Append
}

# Cerrar el archivo de texto
$textFile.Close()

Write-Host "Los resultados se han guardado en $txtFilePath."

