@echo off
title AI Data Agent - Super Simple Start
color 0A
echo.
echo ==========================================
echo    AI DATA AGENT - SUPER SIMPLE START
echo ==========================================
echo.

REM Kill any existing processes
taskkill /f /im python.exe >nul 2>&1
taskkill /f /im node.exe >nul 2>&1

REM Start Backend Server
echo Starting Backend Server...
start "Backend" cmd /c "cd /d %~dp0backend && venv\Scripts\activate.bat && python super_simple_server.py"

REM Wait 5 seconds
timeout /t 5 /nobreak >nul

REM Start Frontend Server
echo Starting Frontend Server...
start "Frontend" cmd /c "cd /d %~dp0frontend && npm start"

REM Wait 10 seconds
timeout /t 10 /nobreak >nul

REM Open browser
echo Opening browser...
start http://localhost:3000

echo.
echo ✅ DONE! Your AI Data Agent is starting...
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend: http://127.0.0.1:8000
echo.
echo 💡 Keep the two command windows open!
echo 💡 Your app will be ready in 30 seconds!
echo.
pause
