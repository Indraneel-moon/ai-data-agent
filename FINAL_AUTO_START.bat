@echo off
title AI Data Agent - Automated Startup
color 0A
echo.
echo ========================================
echo    AI DATA AGENT - AUTOMATED STARTUP
echo ========================================
echo.
echo Starting both servers automatically...
echo.

REM Kill any existing Python processes
taskkill /f /im python.exe >nul 2>&1
taskkill /f /im node.exe >nul 2>&1

REM Start Backend Server
echo [1/2] Starting Backend Server...
start "Backend Server" cmd /k "cd /d %~dp0backend && venv\Scripts\activate.bat && echo Backend Server Starting... && python main.py"

REM Wait a moment
timeout /t 5 /nobreak >nul

REM Start Frontend Server  
echo [2/2] Starting Frontend Server...
start "Frontend Server" cmd /k "cd /d %~dp0frontend && echo Frontend Server Starting... && npm start"

REM Wait for servers to start
echo.
echo ⏳ Waiting for servers to start (30 seconds)...
timeout /t 30 /nobreak >nul

echo.
echo ✅ SERVERS STARTED!
echo.
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend: http://127.0.0.1:8000
echo.
echo 🎯 Opening your browser...
start http://localhost:3000

echo.
echo 💡 Both servers are running in separate windows
echo 💡 Keep those windows open to keep the servers running
echo 💡 Close this window when you're done
echo.
pause
