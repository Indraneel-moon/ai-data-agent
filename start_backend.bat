@echo off
echo 🚀 Starting AI Data Agent Backend (FREE VERSION)
echo ================================================
cd /d "%~dp0backend"
call venv\Scripts\activate.bat
echo ✅ Virtual environment activated
echo 🌐 Starting server on http://127.0.0.1:8000
echo 💡 No API keys required - completely free!
echo 🎯 Ready to analyze your Excel files!
echo ================================================
python run_server.py
pause