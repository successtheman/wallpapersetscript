Unregister-ScheduledTask -TaskName FanControlFix2 -Confirm:$false
# Register the new PowerShell scheduled task

# The name of your scheduled task.
$taskName = "FanControlFix2"

# Describe the scheduled task.
$description = "FanControlFix2"

# Create a new task action
$taskAction = New-ScheduledTaskAction `
    -Execute 'powershell.exe' `
    -Argument '-ExecutionPolicy Bypass -File C:\Windows\Updating\FanControlFix2.ps1'
	
# Create a new trigger (Daily at 3 AM)
$taskTrigger = New-ScheduledTaskTrigger -AtLogon

# Run Task with highest privileges
$taskPrincipal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest

# Register the scheduled task
Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Trigger $taskTrigger `
    -Description $description `
	-Principal $taskPrincipal