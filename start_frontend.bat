@echo off
echo 🎨 Starting AI Data Agent Frontend
echo ==================================
cd /d "%~dp0frontend"
echo ✅ Installing dependencies...
call npm install
echo 🌐 Starting frontend on http://localhost:3000
echo 🎯 Beautiful animations and professional design!
echo ================================================
call npm start
pause