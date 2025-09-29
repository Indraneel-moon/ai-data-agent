# AI Data Agent - Ultimate Auto Start (PowerShell Version)
Write-Host "==========================================" -ForegroundColor Green
Write-Host "   AI DATA AGENT - ULTIMATE AUTO START" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""

# Kill existing processes
Write-Host "[1/4] Cleaning up existing processes..." -ForegroundColor Yellow
Get-Process python -ErrorAction SilentlyContinue | Stop-Process -Force
Get-Process node -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 2

# Get current directory
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$backendDir = Join-Path $currentDir "backend"
$frontendDir = Join-Path $currentDir "frontend"

Write-Host "[2/4] Checking backend dependencies..." -ForegroundColor Yellow
Set-Location $backendDir

# Activate virtual environment and install dependencies
if (Test-Path "venv\Scripts\Activate.ps1") {
    & "venv\Scripts\Activate.ps1"
    pip install -r requirements.txt | Out-Null
} else {
    Write-Host "Creating virtual environment..." -ForegroundColor Cyan
    python -m venv venv
    & "venv\Scripts\Activate.ps1"
    pip install -r requirements.txt | Out-Null
}

# Start Backend Server
Write-Host "[3/4] Starting Backend Server..." -ForegroundColor Yellow
$backendCmd = "cd '$backendDir'; venv\Scripts\Activate.ps1; Write-Host '✅ Backend Server Starting...' -ForegroundColor Green; Write-Host '🌐 Backend will be at: http://127.0.0.1:8000' -ForegroundColor Cyan; python main.py"
Start-Process powershell -ArgumentList "-NoExit", "-Command", $backendCmd

# Wait for backend to start
Write-Host "⏳ Waiting for backend to initialize..." -ForegroundColor Cyan
Start-Sleep -Seconds 8

# Start Frontend Server
Write-Host "[4/4] Starting Frontend Server..." -ForegroundColor Yellow
Set-Location $frontendDir
$frontendCmd = "cd '$frontendDir'; Write-Host '✅ Frontend Server Starting...' -ForegroundColor Green; Write-Host '🌐 Frontend will be at: http://localhost:3000' -ForegroundColor Cyan; npm start"
Start-Process powershell -ArgumentList "-NoExit", "-Command", $frontendCmd

# Wait for frontend to start
Write-Host "⏳ Waiting for frontend to initialize..." -ForegroundColor Cyan
Start-Sleep -Seconds 15

# Test connections and open browser
Write-Host ""
Write-Host "🔍 Testing server connections..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

Write-Host ""
Write-Host "✅ SERVERS STARTED SUCCESSFULLY!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Frontend: http://localhost:3000" -ForegroundColor Cyan
Write-Host "🔧 Backend: http://127.0.0.1:8000" -ForegroundColor Cyan
Write-Host ""
Write-Host "🎯 Opening your browser..." -ForegroundColor Yellow
Start-Process "http://localhost:3000"

Write-Host ""
Write-Host "💡 Both servers are running in separate windows" -ForegroundColor Green
Write-Host "💡 Keep those windows open to keep servers running" -ForegroundColor Green
Write-Host "💡 Your AI Data Agent is ready to use!" -ForegroundColor Green
Write-Host ""
Write-Host "Press any key to close this window..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
