@echo off
echo 🎯 AI Data Agent - Automated Startup
echo ====================================
echo.
echo Starting both backend and frontend servers automatically...
echo.

REM Navigate to the project directory
cd /d "%~dp0"

REM Run the automated startup script
python auto_start.py

echo.
echo Press any key to exit...
pause > nul
