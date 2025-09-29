@echo off
echo Creating desktop shortcut for AI Data Agent...

REM Create a VBS script to create the shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%USERPROFILE%\Desktop\AI Data Agent.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp0START_FOREVER.bat" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%~dp0" >> CreateShortcut.vbs
echo oLink.Description = "AI Data Agent - Start Forever" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

REM Run the VBS script
cscript CreateShortcut.vbs

REM Clean up
del CreateShortcut.vbs

echo.
echo ✅ Desktop shortcut created!
echo 🎯 You can now double-click "AI Data Agent" on your desktop
echo 💡 It will start both servers automatically and keep them running
echo.
pause
