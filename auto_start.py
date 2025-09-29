#!/usr/bin/env python3
"""
Automated startup script for AI Data Agent
This script will start both backend and frontend servers automatically
"""

import subprocess
import time
import sys
import os
import threading
import requests
from pathlib import Path

def check_server(url, name):
    """Check if a server is running"""
    try:
        response = requests.get(url, timeout=2)
        return response.status_code == 200
    except:
        return False

def start_backend():
    """Start the backend server"""
    print("🚀 Starting Backend Server...")
    backend_dir = Path(__file__).parent / "backend"
    
    # Change to backend directory
    os.chdir(backend_dir)
    
    # Activate virtual environment and start server
    if os.name == 'nt':  # Windows
        activate_cmd = "venv\\Scripts\\activate.bat"
        python_cmd = "venv\\Scripts\\python.exe"
    else:  # Unix/Linux/Mac
        activate_cmd = "source venv/bin/activate"
        python_cmd = "venv/bin/python"
    
    # Start the server
    try:
        subprocess.run([python_cmd, "main.py"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"❌ Backend startup failed: {e}")
        return False
    except KeyboardInterrupt:
        print("🛑 Backend stopped by user")
        return False

def start_frontend():
    """Start the frontend server"""
    print("🎨 Starting Frontend Server...")
    frontend_dir = Path(__file__).parent / "frontend"
    
    # Change to frontend directory
    os.chdir(frontend_dir)
    
    # Start the React development server
    try:
        subprocess.run(["npm", "start"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"❌ Frontend startup failed: {e}")
        return False
    except KeyboardInterrupt:
        print("🛑 Frontend stopped by user")
        return False

def main():
    """Main function to start both servers"""
    print("🎯 AI Data Agent - Automated Startup")
    print("=" * 50)
    
    # Check if we're in the right directory
    if not Path("backend").exists() or not Path("frontend").exists():
        print("❌ Error: Please run this script from the ai-data-agent directory")
        print("Current directory:", os.getcwd())
        sys.exit(1)
    
    print("✅ Found backend and frontend directories")
    
    # Start backend in a separate thread
    backend_thread = threading.Thread(target=start_backend, daemon=True)
    backend_thread.start()
    
    # Wait a bit for backend to start
    print("⏳ Waiting for backend to start...")
    time.sleep(5)
    
    # Check if backend is running
    if check_server("http://127.0.0.1:8000", "Backend"):
        print("✅ Backend is running on http://127.0.0.1:8000")
    else:
        print("❌ Backend failed to start")
        return
    
    # Start frontend in a separate thread
    frontend_thread = threading.Thread(target=start_frontend, daemon=True)
    frontend_thread.start()
    
    # Wait a bit for frontend to start
    print("⏳ Waiting for frontend to start...")
    time.sleep(10)
    
    # Check if frontend is running
    if check_server("http://localhost:3000", "Frontend"):
        print("✅ Frontend is running on http://localhost:3000")
    else:
        print("❌ Frontend failed to start")
        return
    
    print("\n🎉 SUCCESS! Both servers are running!")
    print("🌐 Open your browser and go to: http://localhost:3000")
    print("📊 Your AI Data Agent is ready to analyze Excel files!")
    print("\n💡 Press Ctrl+C to stop both servers")
    
    try:
        # Keep the script running
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n🛑 Shutting down servers...")
        print("👋 Goodbye!")

if __name__ == "__main__":
    main()
