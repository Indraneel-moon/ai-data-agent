@echo off
title AI Data Agent - Start Forever
color 0A
echo.
echo ==========================================
echo    AI DATA AGENT - START FOREVER
echo ==========================================
echo.

:START_LOOP
echo [%date% %time%] Starting AI Data Agent...

REM Kill existing processes
taskkill /f /im python.exe >nul 2>&1
taskkill /f /im node.exe >nul 2>&1

REM Start Backend
echo Starting Backend Server...
start "Backend" cmd /c "cd /d %~dp0backend && venv\Scripts\activate.bat && python super_simple_server.py"

REM Wait
timeout /t 8 /nobreak >nul

REM Start Frontend
echo Starting Frontend Server...
start "Frontend" cmd /c "cd /d %~dp0frontend && npm start"

REM Wait
timeout /t 15 /nobreak >nul

REM Open browser (only first time)
if not exist "browser_opened.flag" (
    echo Opening browser...
    start http://localhost:3000
    echo. > browser_opened.flag
)

echo.
echo ✅ AI Data Agent is running!
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend: http://127.0.0.1:8000
echo.
echo 💡 This window will keep the servers running forever
echo 💡 Press Ctrl+C to stop
echo.

:MONITOR_LOOP
timeout /t 30 /nobreak >nul

REM Check if processes are still running
tasklist /fi "imagename eq python.exe" | find /i "python.exe" >nul
if errorlevel 1 (
    echo Backend stopped, restarting...
    goto START_LOOP
)

tasklist /fi "imagename eq node.exe" | find /i "node.exe" >nul
if errorlevel 1 (
    echo Frontend stopped, restarting...
    goto START_LOOP
)

goto MONITOR_LOOP
