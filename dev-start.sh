#!/bin/bash

echo "🚀 Instagram Post Generator - Local Development Server"
echo "=================================================="
echo ""

# Check if Node.js is installed
if command -v node &> /dev/null; then
    echo "✅ Node.js detected"
    
    # Check if dependencies are installed
    if [ ! -d "node_modules" ]; then
        echo "📦 Installing development dependencies..."
        npm install
        echo ""
    fi
    
    echo "🌟 Choose your development server:"
    echo "1) Live Server (auto-reload) - Recommended"
    echo "2) HTTP Server (simple)"
    echo "3) Python Server (no Node dependencies)"
    echo ""
    read -p "Enter your choice (1-3): " choice
    
    case $choice in
        1)
            echo "🔄 Starting Live Server with auto-reload..."
            npm run dev
            ;;
        2)
            echo "📡 Starting HTTP Server..."
            npm run serve
            ;;
        3)
            echo "🐍 Starting Python Server..."
            python3 -m http.server 3000
            ;;
        *)
            echo "⚡ Starting Live Server (default)..."
            npm run dev
            ;;
    esac
else
    echo "⚠️  Node.js not found, using Python server..."
    echo "🐍 Starting Python Server on http://localhost:3000"
    python3 -m http.server 3000
fi