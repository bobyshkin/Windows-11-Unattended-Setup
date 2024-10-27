:: Copy Scripts to Disk
powershell.exe -Command "Copy-Item -Path D:\Scripts -Destination C:\Windows\Setup\Scripts\ -Recurse -Verbose"

:: Executes the remove-packages Powershell Script
powershell.exe -ExecutionPolicy Bypass -File "C:\Windows\Setup\Scripts\Remove-AppxProvisionedPackages.ps1"

:: Run Chris Titus WinUtil Tweaks
powershell.exe -ExecutionPolicy Bypass -File "C:\Windows\Setup\Scripts\WinTweaks.ps1"

:: Executes the HKLM Registry Entries Script
cmd.exe /c "C:\Windows\Setup\Scripts\localmachine.cmd &gt;&gt;"C:\Windows\Setup\Scripts\localmachine.log" 2&gt;&amp;1"

:: Loads the Default User Registry Hive so Changes Can be Made to It
reg.exe load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT"

:: Registry Entry to Execute the HKCU Registry Entry Script the First Time a New User Logs In
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Runonce" /v "currentuser" /t REG_SZ /d "C:\Windows\Setup\Scripts\currentuser.cmd" /f

:: Unloads the Default User Registry Hive
reg.exe unload "HKU\DefaultUser"

:: Disable Copilot
cmd.exe /c "reg.exe import "C:\Windows\Setup\Scripts\DisableCopilot.reg" &gt;&gt;"C:\Windows\Setup\Scripts\DisableCopilot.log" 2&gt;&amp;1"

:: Disable Windows Defender
powershell.exe -ExecutionPolicy Bypass -File "C:\Windows\Setup\Scripts\DisableDefender.ps1"
