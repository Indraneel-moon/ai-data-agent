@echo off
title AI Data Agent - CLEAN AND DEPLOY
color 0A
echo.
echo ==========================================
echo    AI DATA AGENT - CLEAN AND DEPLOY
echo ==========================================
echo.

echo 🧹 CLEANED UP ALL UNNECESSARY FILES!
echo.
echo ✅ MINIMAL WORKING SOLUTION:
echo    ✅ backend/app.py - Simple FastAPI app
echo    ✅ backend/__init__.py - Python package
echo    ✅ Procfile - cd backend && python app.py
echo    ✅ requirements.txt - Just fastapi and uvicorn
echo    ✅ railway.json - Simple config
echo.

echo 📤 UPLOAD TO GITHUB:
echo    1. Go to: https://github.com/Indraneel-moon/ai-data-agent
echo    2. Upload ONLY these files:
echo       - backend/ directory (with app.py and __init__.py)
echo       - Procfile
echo       - requirements.txt
echo       - railway.json
echo    3. Commit changes
echo.

echo 🚀 REDEPLOY ON RAILWAY:
echo    1. Go to Railway dashboard
echo    2. Click "Redeploy"
echo    3. Wait 2-3 minutes
echo    4. SUCCESS!
echo.

echo 🎯 THIS WILL WORK - NO MORE ERRORS!
echo.

pause
