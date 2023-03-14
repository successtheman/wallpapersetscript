$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
$DesktopPath = "DesktopImagePath"
$DesktopStatus = "DesktopImageStatus"
$DesktopUrl = "DesktopImageUrl"
$StatusValue = "1"
$url = "https://i.imgur.com/GvOm43C.jpg"
$DesktopImageValue = "C:\Windows\Updating\wallpaper.jpg"
$directory = "C:\Windows\Updating\"

If ((Test-Path -Path $directory) -eq $false)

{

New-Item -Path $directory -ItemType directory

}

$wc = New-Object System.Net.WebClient

$wc.DownloadFile($url, $DesktopImageValue)

if (!(Test-Path $RegKeyPath))

{

Write-Host "Creating registry path $($RegKeyPath)."

New-Item -Path $RegKeyPath -Force | Out-Null

}

New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null

New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null

New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null