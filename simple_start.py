import subprocess
import time
import os
import sys

def main():
    print("🚀 Starting AI Data Agent - Automated Mode")
    print("=" * 50)
    
    # Get the current directory
    current_dir = os.getcwd()
    backend_dir = os.path.join(current_dir, "backend")
    frontend_dir = os.path.join(current_dir, "frontend")
    
    print(f"📁 Backend directory: {backend_dir}")
    print(f"📁 Frontend directory: {frontend_dir}")
    
    # Start backend
    print("\n🔧 Starting Backend Server...")
    backend_cmd = [
        "cmd", "/c", 
        f"cd /d {backend_dir} && venv\\Scripts\\activate.bat && python main.py"
    ]
    
    # Start frontend
    print("🎨 Starting Frontend Server...")
    frontend_cmd = [
        "cmd", "/c",
        f"cd /d {frontend_dir} && npm start"
    ]
    
    try:
        # Start both processes
        print("⚡ Launching servers...")
        subprocess.Popen(backend_cmd, shell=True)
        time.sleep(3)  # Wait a bit for backend to start
        subprocess.Popen(frontend_cmd, shell=True)
        
        print("\n✅ Both servers are starting!")
        print("🌐 Frontend: http://localhost:3000")
        print("🔧 Backend: http://127.0.0.1:8000")
        print("\n⏳ Please wait 30-60 seconds for both servers to fully start...")
        print("🎯 Then open your browser and go to: http://localhost:3000")
        print("\n💡 Press Ctrl+C to stop this script (servers will keep running)")
        
        # Keep the script running
        while True:
            time.sleep(1)
            
    except KeyboardInterrupt:
        print("\n🛑 Script stopped by user")
        print("💡 The servers are still running in separate windows")
        print("🌐 Go to http://localhost:3000 to use your app!")

if __name__ == "__main__":
    main()
