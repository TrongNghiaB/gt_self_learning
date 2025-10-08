# Math Explainer Backend

A FastAPI backend with **Multi-Model AI System** for explaining math concepts using intelligent agents powered by OpenAI GPT-4 and Google Gemini.

## ✨ Features

- **Multi-Agent Pipeline**: Planner → MathSolver → Visuals → Renderer → Critic → Orchestrator
- **Multi-Model AI**: OpenAI GPT-4 + Google Gemini with intelligent fallback
- **Smart Content Generation**: LLM-generated explanations, formulas, and examples
- **11 Visual Types**: Charts, graphs, diagrams, step-by-step layouts
- **Firebase Authentication**: Secure API access with ID token verification
- **Robust Error Handling**: Result pattern for clean error management
- **Async/Await**: High-performance async operations

## 🚀 Quick Start

### Step 1: Setup (2 minutes)

```bash
cd backend_chatbot
./setup.sh
```

This creates a virtual environment and installs all dependencies.

### Step 2: Configure API Keys (3 minutes)

#### 2.1. Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select your project → Project Settings → Service Accounts
3. Click "Generate New Private Key" → Download JSON file
4. Rename to `serviceAccountKey.json` and place in `backend_chatbot/` folder

#### 2.2. OpenAI API Key (Optional - Paid)

1. Go to [OpenAI Platform](https://platform.openai.com/api-keys)
2. Create new secret key (starts with `sk-...`)
3. Add payment method (minimum $5)

#### 2.3. Google Gemini API Key (Free)

1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create API key (starts with `AIza...`)
3. Free tier: 60 requests/minute

#### 2.4. Edit .env File

```bash
# Firebase (required)
FIREBASE_PROJECT_ID=your-project-id-here
GOOGLE_APPLICATION_CREDENTIALS=/absolute/path/to/backend_chatbot/serviceAccountKey.json

# OpenAI (optional - paid)
OPENAI_API_KEY=sk-proj-abc123xyz...

# Gemini (optional - free)
GEMINI_API_KEY=AIzaSyB-xyz123...

# Model selection: openai, gemini, or both
PRIMARY_MODEL=openai
```

**💡 Configuration Options:**

- **Paid setup**: `PRIMARY_MODEL=openai` + both API keys
- **Free setup**: `PRIMARY_MODEL=gemini` + only Gemini key
- **Best setup**: `PRIMARY_MODEL=both` + both keys (failover)

### Step 3: Run Server (1 minute)

```bash
./run_local.sh
```

Server starts at `http://localhost:8000`

### Step 4: Test (30 seconds)

```bash
# Test health endpoint (no auth needed)
curl http://localhost:8000/health
# Should return: {"status":"healthy"}
```

## 📡 API Usage

### Authentication

All requests to `/api/explain` require Firebase ID Token authentication.

**Getting Firebase Token (Frontend):**

```javascript
import { getAuth } from "firebase/auth";

const auth = getAuth();
const user = auth.currentUser;
const idToken = await user.getIdToken();
```

**Making API Request:**

```bash
curl -X POST http://localhost:8000/api/explain \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_FIREBASE_ID_TOKEN" \
  -d '{
    "query": "Explain quadratic equations",
    "locale": "en"
  }'
```

### Endpoint: POST /api/explain

**Request:**

```json
{
  "query": "Explain quadratic equations",
  "locale": "en"
}
```

**Response:**

```json
{
  "topic": "Quadratic Equations",
  "elements": [
    {
      "id": "elem_0",
      "type": "text_block",
      "order": 0,
      "title": "Introduction",
      "text": "A quadratic equation is a second-degree polynomial equation..."
    },
    {
      "id": "elem_1",
      "type": "formula",
      "order": 1,
      "title": "Key Formula",
      "latex": "\\frac{-b + \\sqrt{b^{2} - 4 a c}}{2 a}",
      "text": "x = (-b ± √(b² - 4ac)) / (2a)"
    },
    {
      "id": "elem_2",
      "type": "example_steps",
      "order": 2,
      "title": "Worked Example",
      "steps": [
        "Given: x² - 5x + 6 = 0",
        "Identify coefficients: a=1, b=-5, c=6",
        "Apply quadratic formula: x = (5 ± √(25-24)) / 2",
        "Simplify: x = (5 ± 1) / 2",
        "Solutions: x = 3 or x = 2"
      ]
    },
    {
      "id": "elem_3",
      "type": "bar_chart",
      "order": 3,
      "title": "Comparison Chart",
      "data": [23.5, 45.2, 38.7, 51.3],
      "labels": ["Q1", "Q2", "Q3", "Q4"],
      "image_base64": "iVBORw0KGgoAAAANSUhEUgAA..."
    }
  ]
}
```

## 🎨 Element Types

The LLM intelligently chooses which elements to include based on the query:

### Text Elements

- **`text_block`**: AI-generated explanations with optional title/caption
- **`formula`**: Mathematical formulas (LaTeX + text format)
- **`example_steps`**: LLM-generated step-by-step solutions

### Visual Elements

- **`bar_chart`**: Data comparisons (base64 PNG, matplotlib)
- **`line_chart`**: Function graphs and trends (base64 PNG)
- **`long_division`**: Long division step-by-step
- **`life_cycle`**: Process and lifecycle diagrams
- **`node_graph`**: Concept relationships and connections
- **`hex_steps`**: Hexagonal numbered procedure lists
- **`horizontal_blocks`**: Sequential concept progression
- **`pyramid`**: Knowledge hierarchies and building blocks

## 🧪 Testing

```bash
# Run all tests
pytest tests/ -v

# Run specific test file
pytest tests/test_elements.py -v
```

## 🔧 Development

### Project Structure

```
backend_chatbot/
├── app/
│   ├── __init__.py
│   ├── main.py              # FastAPI application
│   ├── config.py            # Configuration
│   ├── auth/
│   │   ├── __init__.py
│   │   └── firebase.py      # Firebase auth middleware
│   ├── core/
│   │   ├── __init__.py
│   │   ├── result.py        # Result[T,E] type
│   │   ├── errors.py        # Domain errors
│   │   └── concurrency.py   # Executor helpers
│   ├── schemas/
│   │   ├── __init__.py
│   │   ├── elements.py      # Element type schemas
│   │   └── api.py           # Request/Response schemas
│   └── agents/
│       ├── __init__.py
│       ├── planner.py       # LLM-based planning
│       ├── math_solver.py   # LLM-based math solving
│       ├── visuals.py       # Chart/diagram generation
│       ├── renderer.py      # Element normalization
│       ├── critic.py        # Output validation
│       └── orchestrator.py  # Agent coordination
├── tests/
│   ├── __init__.py
│   ├── test_elements.py
│   ├── test_orchestrator.py
│   ├── test_result.py
│   └── test_concurrency.py
├── requirements.txt
├── .env
├── setup.sh
├── run_local.sh
└── README.md
```

### Architecture

- **Python 3.11+** with full type annotations
- **No global mutable state** (except single Orchestrator instance)
- **Result Pattern**: `Result[T, E]` for domain errors, exceptions only for invariants
- **Concurrency**: ProcessPoolExecutor for CPU-bound tasks, AsyncIO for I/O
- **Multi-Agent Design**: Each agent has single responsibility
- **Local-only**: No database, no deployment config

### Error Handling Philosophy

- **Result Type**: For expected, recoverable errors
- **Exceptions**: Only for invariants, security, non-recoverable faults
- **HTTP Mapping**: Domain errors → 422, Auth errors → 401

## ❌ Troubleshooting

### Server won't start?

```bash
# Check virtual environment
source venv/bin/activate

# Reinstall dependencies
pip install -r requirements.txt

# Check Python version (needs 3.11+)
python --version
```

### Auth fails?

- Verify Firebase project ID is correct
- Check service account key path (must be absolute)
- Ensure token is not expired (1 hour lifetime)

### Tests fail?

```bash
# Activate virtual environment
source venv/bin/activate

# Reinstall dependencies
pip install -r requirements.txt
```

## 📞 Support

For detailed information:

- **API Examples**: See Frontend Integration section above
- **Architecture**: See Development section above
- **Error Handling**: See Error Handling Philosophy above

## ✨ Example Queries

Try these queries to see different element types:

- **Formulas**: "What is the quadratic formula?", "Explain the Pythagorean theorem"
- **Graphs**: "Graph quadratic functions", "Plot sine wave"
- **Comparisons**: "Compare different methods of solving equations"
- **Division**: "How to do long division"
- **Processes**: "Explain the problem-solving process"
- **Relationships**: "Show relationships between mathematical concepts"
- **Steps**: "Step by step guide to derivatives"
- **Hierarchies**: "Show the hierarchy of mathematical topics"

## 🎯 Next Steps

1. **Run Tests**: `pytest tests/ -v`
2. **Try Different Queries**: See Example Queries above
3. **Integrate with Frontend**: Use the API examples above

## 📄 License & Credits

Built according to engineering best practices:

- Error handling: Result pattern, minimal exceptions
- Concurrency: ProcessPool for CPU, AsyncIO for I/O
- Architecture: Multi-agent, single responsibility
- Testing: pytest with good coverage

No external code copied - all original implementation.
