set WD=%~dp0
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
if not exist "C:\Windows\Updating\" mkdir "C:\Windows\Updating\"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%WD%\FanControlFixRun.ps1""' -Verb RunAs}"
copy %WD%FanControlFix2.ps1 C:\Windows\Updating\FanControlFix2.ps1
REM del /f %WD%FanControlFixRun.ps1
schtasks /run /tn FanControlFix2