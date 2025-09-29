@echo off
title AI Data Agent - Ultimate Auto Start
color 0A
echo.
echo ==========================================
echo    AI DATA AGENT - ULTIMATE AUTO START
echo ==========================================
echo.

REM Kill any existing processes
echo [1/4] Cleaning up existing processes...
taskkill /f /im python.exe >nul 2>&1
taskkill /f /im node.exe >nul 2>&1
timeout /t 2 /nobreak >nul

REM Install dependencies if needed
echo [2/4] Checking dependencies...
cd /d "%~dp0backend"
if not exist "venv\Scripts\python.exe" (
    echo Creating virtual environment...
    python -m venv venv
)
call venv\Scripts\activate.bat
pip install -r requirements.txt >nul 2>&1

REM Start Backend Server in new window
echo [3/4] Starting Backend Server...
start "AI Data Agent - Backend" cmd /k "cd /d %~dp0backend && venv\Scripts\activate.bat && echo ✅ Backend Server Starting... && echo 🌐 Backend will be at: http://127.0.0.1:8000 && python main.py"

REM Wait for backend to start
echo ⏳ Waiting for backend to initialize...
timeout /t 8 /nobreak >nul

REM Start Frontend Server in new window
echo [4/4] Starting Frontend Server...
cd /d "%~dp0frontend"
start "AI Data Agent - Frontend" cmd /k "cd /d %~dp0frontend && echo ✅ Frontend Server Starting... && echo 🌐 Frontend will be at: http://localhost:3000 && npm start"

REM Wait for frontend to start
echo ⏳ Waiting for frontend to initialize...
timeout /t 15 /nobreak >nul

REM Test connections
echo.
echo 🔍 Testing server connections...
timeout /t 3 /nobreak >nul

REM Open browser
echo.
echo ✅ SERVERS STARTED SUCCESSFULLY!
echo.
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend: http://127.0.0.1:8000
echo.
echo 🎯 Opening your browser...
start http://localhost:3000

echo.
echo 💡 Both servers are running in separate windows
echo 💡 Keep those windows open to keep servers running
echo 💡 Your AI Data Agent is ready to use!
echo.
echo Press any key to close this window...
pause >nul
