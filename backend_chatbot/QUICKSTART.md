# Quick Start Guide

## 🚀 Get Started in 5 Minutes

### Step 1: Setup (2 minutes)

```bash
cd backend_chatbot
./setup.sh
```

This creates a virtual environment and installs all dependencies.

### Step 2: Configure Firebase (2 minutes)

1. Download your Firebase service account key:

   - Go to [Firebase Console](https://console.firebase.google.com)
   - Select your project
   - Go to Project Settings → Service Accounts
   - Click "Generate New Private Key"
   - Save as `serviceAccountKey.json` in the `backend_chatbot` folder

2. Edit `.env` file:
   ```bash
   FIREBASE_PROJECT_ID=your-project-id-here
   GOOGLE_APPLICATION_CREDENTIALS=/absolute/path/to/backend_chatbot/serviceAccountKey.json
   ```

### Step 3: Run Server (1 minute)

```bash
./run.sh
```

Server will start at `http://localhost:8000`

### Step 4: Test (30 seconds)

Open another terminal:

```bash
# Test health endpoint (no auth needed)
curl http://localhost:8000/health

# Should return: {"status":"healthy"}
```

### Step 5: Get Firebase Token from Frontend

In your frontend code (which already uses Firebase):

```javascript
import { getAuth } from "firebase/auth";

const auth = getAuth();
const user = auth.currentUser;
const idToken = await user.getIdToken();

// Use this token to call the API
const response = await fetch("http://localhost:8000/api/explain", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    Authorization: `Bearer ${idToken}`,
  },
  body: JSON.stringify({
    query: "Explain quadratic equations",
    locale: "en",
  }),
});

const data = await response.json();
console.log(data.topic);
console.log(data.elements);
```

## 📚 What You Get

✅ **Multi-Model AI**: OpenAI GPT-4 + Google Gemini with intelligent fallback

✅ **11 Element Types**: text_block, formula, example_steps, bar_chart, line_chart, long_division, life_cycle, node_graph, hex_steps, horizontal_blocks, pyramid

✅ **Multi-Agent Pipeline**: Planner → MathSolver → Visuals → Renderer → Critic

✅ **Firebase Auth**: Full ID token verification

✅ **Smart Content**: LLM-generated explanations, not hardcoded templates

✅ **Async/Await**: High-performance async operations

✅ **Complete Tests**: pytest with async support

✅ **Full Documentation**: README, API_USAGE, TESTING, HUONG_DAN_SETUP (Vietnamese)

## 🎯 Next Steps

1. **Run Tests**:

   ```bash
   source venv/bin/activate
   pytest tests/ -v
   ```

2. **Read Documentation**:

   - `README.md` - Main documentation
   - `API_USAGE.md` - API examples and frontend integration
   - `TESTING.md` - Testing guide
   - `PROJECT_OVERVIEW.md` - Architecture and design decisions

3. **Try Different Queries**:
   - "Explain quadratic equations"
   - "What is the derivative?"
   - "Graph quadratic functions"
   - "How to do long division step by step"

## 🔧 Troubleshooting

**Server won't start?**

- Check `.env` file is configured
- Verify service account JSON exists
- Run `./setup.sh` again

**Auth fails?**

- Verify Firebase project ID is correct
- Check service account key path
- Ensure token is not expired (1 hour lifetime)

**Tests fail?**

- Activate virtual environment: `source venv/bin/activate`
- Reinstall dependencies: `pip install -r requirements.txt`

## 📞 Support

Check these files for detailed information:

- Errors/debugging: `TESTING.md`
- API usage: `API_USAGE.md`
- Architecture: `PROJECT_OVERVIEW.md`

## ✨ Features Highlight

**Query**: "Explain quadratic equations"

**Response** includes:

- 📝 Text introduction
- 🔢 Quadratic formula (LaTeX + text)
- 📋 Step-by-step example
- 📊 Function graph (base64 PNG)

All ordered top→bottom, ready to render in your frontend!
