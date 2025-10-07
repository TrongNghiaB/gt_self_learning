#!/bin/bash
# Quick start script for Math Explainer Backend

echo "🚀 Starting Math Explainer Backend..."
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run setup.sh first."
    exit 1
fi

# Activate virtual environment
source venv/bin/activate

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found. Copy .env.example to .env and configure Firebase."
fi

# Start the server
echo "📡 Starting uvicorn server on http://0.0.0.0:8000"
echo ""
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

