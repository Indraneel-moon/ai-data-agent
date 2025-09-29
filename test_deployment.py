#!/usr/bin/env python3
"""
Test script to verify the AI Data Agent backend is working
"""

import requests
import json
import time

def test_backend():
    """Test the backend server"""
    print("🧪 Testing AI Data Agent Backend...")
    
    # Test health endpoint
    try:
        response = requests.get("http://127.0.0.1:8000/health", timeout=5)
        if response.status_code == 200:
            print("✅ Health check: PASSED")
        else:
            print("❌ Health check: FAILED")
            return False
    except:
        print("❌ Health check: FAILED (Server not running)")
        return False
    
    # Test root endpoint
    try:
        response = requests.get("http://127.0.0.1:8000/", timeout=5)
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Root endpoint: PASSED - {data.get('message', 'OK')}")
        else:
            print("❌ Root endpoint: FAILED")
            return False
    except:
        print("❌ Root endpoint: FAILED")
        return False
    
    print("🎉 Backend is working perfectly!")
    return True

def test_frontend():
    """Test the frontend server"""
    print("\n🧪 Testing AI Data Agent Frontend...")
    
    try:
        response = requests.get("http://localhost:3000", timeout=5)
        if response.status_code == 200:
            print("✅ Frontend: PASSED")
            return True
        else:
            print("❌ Frontend: FAILED")
            return False
    except:
        print("❌ Frontend: FAILED (Server not running)")
        return False

def main():
    """Main test function"""
    print("=" * 50)
    print("   AI DATA AGENT - DEPLOYMENT TEST")
    print("=" * 50)
    
    backend_ok = test_backend()
    frontend_ok = test_frontend()
    
    print("\n" + "=" * 50)
    print("   TEST RESULTS")
    print("=" * 50)
    
    if backend_ok and frontend_ok:
        print("🎉 ALL TESTS PASSED!")
        print("✅ Your AI Data Agent is ready for deployment!")
        print("🌐 Backend: http://127.0.0.1:8000")
        print("🎨 Frontend: http://localhost:3000")
        print("\n🚀 Ready to deploy online!")
    else:
        print("❌ Some tests failed.")
        if not backend_ok:
            print("   - Backend server needs to be started")
        if not frontend_ok:
            print("   - Frontend server needs to be started")
        print("\n💡 Start both servers and run this test again.")

if __name__ == "__main__":
    main()
