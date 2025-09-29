@echo off
echo 🚀 Starting Your AI Data Agent - Everything Setup for You!
echo ========================================================
echo.
echo ✅ This will start both the backend and frontend for you
echo ✅ No need to do anything else - just wait!
echo.
echo 🌐 Starting Backend Server...
cd /d "%~dp0backend"
call venv\Scripts\activate.bat
start "Backend Server" cmd /k "python simple_backend.py"
echo ✅ Backend server started in new window
echo.
echo 🌐 Starting Frontend Server...
cd /d "%~dp0frontend"
start "Frontend Server" cmd /k "npm start"
echo ✅ Frontend server started in new window
echo.
echo 🎉 Both servers are starting up!
echo.
echo 📱 Your app will be available at: http://localhost:3000
echo 🔧 Backend API at: http://127.0.0.1:8000
echo.
echo ⏳ Please wait 30 seconds for everything to load...
echo 🎯 Then open your browser and go to: http://localhost:3000
echo.
echo 💡 Upload an Excel file and start asking questions!
echo.
pause
