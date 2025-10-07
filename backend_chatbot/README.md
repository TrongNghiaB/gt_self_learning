# Math Explainer Backend

A FastAPI backend with **Multi-Model AI System** for explaining math concepts using intelligent agents powered by OpenAI GPT-4 and Google Gemini.

## ✨ Features

- **Multi-Agent Pipeline**: Planner → MathSolver → Visuals → Renderer → Critic → Orchestrator
- **Multi-Model AI**: OpenAI GPT-4 + Google Gemini with intelligent fallback
- **Smart Content Generation**: LLM-generated explanations, formulas, and examples
- **8 Visual Types**: Charts, graphs, diagrams, step-by-step layouts
- **Firebase Authentication**: Secure API access with ID token verification
- **Robust Error Handling**: Result pattern for clean error management
- **Async/Await**: High-performance async operations

## Setup

1. **Create virtual environment:**

   ```bash
   python3.11 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. **Install dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

3. **Configure API Keys:**

   Create/edit `.env` file with:

   ```bash
   # Firebase (required)
   FIREBASE_PROJECT_ID=your-project-id
   GOOGLE_APPLICATION_CREDENTIALS=/path/to/serviceAccountKey.json

   # OpenAI (required if using OpenAI)
   OPENAI_API_KEY=sk-...

   # Gemini (required if using Gemini)
   GEMINI_API_KEY=AIza...

   # Model selection: openai, gemini, or both
   PRIMARY_MODEL=openai
   ```

   **Getting API Keys:**

   - Firebase: [Console](https://console.firebase.google.com) → Project Settings → Service Accounts
   - OpenAI: [Platform](https://platform.openai.com/api-keys) (requires payment)
   - Gemini: [AI Studio](https://makersuite.google.com/app/apikey) (free tier available)

   📖 **Chi tiết bằng tiếng Việt**: Xem file `HUONG_DAN_SETUP.md`

4. **Run the server:**
   ```bash
   uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
   ```

## API Usage

### Endpoint: POST /api/explain

**Authentication:** Required. Send Firebase ID Token in header:

```
Authorization: Bearer <YOUR_FIREBASE_ID_TOKEN>
```

**Request Body:**

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
      "id": "elem_1",
      "type": "text_block",
      "order": 0,
      "title": "Introduction",
      "text": "A quadratic equation is..."
    },
    {
      "id": "elem_2",
      "type": "formula",
      "order": 1,
      "latex": "ax^2 + bx + c = 0"
    }
  ]
}
```

## Element Types

The LLM intelligently chooses which elements to include based on the query:

- `text_block`: AI-generated explanations with optional title/caption
- `formula`: Mathematical formulas (LaTeX + text format)
- `example_steps`: LLM-generated step-by-step solutions
- `bar_chart`: Data comparisons (base64 PNG, matplotlib)
- `line_chart`: Function graphs and trends (base64 PNG)
- `long_division`: Long division step-by-step
- `life_cycle`: Process and lifecycle diagrams
- `node_graph`: Concept relationships and connections
- `hex_steps`: Hexagonal numbered procedure lists
- `horizontal_blocks`: Sequential concept progression
- `pyramid`: Knowledge hierarchies and building blocks

## Testing

```bash
pytest tests/ -v
```

## Development

- Python 3.11+
- Type hints everywhere
- No global mutable state
- Local-only (no database, no deployment)
- Follow error-handling rules: Result pattern for domain errors, exceptions only for invariants

## Project Structure

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
│       ├── planner.py
│       ├── math_solver.py
│       ├── visuals.py
│       ├── renderer.py
│       ├── critic.py
│       └── orchestrator.py
├── tests/
│   ├── __init__.py
│   ├── test_elements.py
│   └── test_orchestrator.py
├── requirements.txt
├── .env.example
└── README.md
```
