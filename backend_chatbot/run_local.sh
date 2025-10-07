#!/bin/bash
# Script để chạy server trong virtual environment

echo "🚀 Starting Math Explainer Backend in Virtual Environment..."
echo ""

# Kiểm tra virtual environment
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run setup.sh first."
    exit 1
fi

# Activate virtual environment
echo "📦 Activating virtual environment..."
source venv/bin/activate

# Kiểm tra Python path
echo "🐍 Python path: $(which python)"
echo "📋 Python version: $(python --version)"
echo ""

# Kiểm tra .env file
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found. Please configure your API keys."
    echo "   See HUONG_DAN_SETUP.md for detailed instructions."
    echo ""
fi

# Kiểm tra dependencies
echo "🔍 Checking dependencies..."
python -c "import fastapi, openai, google.generativeai, firebase_admin; print('✅ All dependencies available')" 2>/dev/null || {
    echo "❌ Missing dependencies. Installing..."
    pip install -r requirements.txt
}

echo ""
echo "📡 Starting uvicorn server on http://0.0.0.0:8000"
echo "   Press Ctrl+C to stop the server"
echo ""

# Start the server
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
