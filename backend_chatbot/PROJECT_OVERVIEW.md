# Math Explainer Backend - Project Overview

## ✅ Project Status: COMPLETE

A production-ready FastAPI backend with Multi-Agent System for explaining math concepts, featuring Firebase Authentication and strict error handling.

## 📁 Project Structure

```
backend_chatbot/
├── app/
│   ├── __init__.py
│   ├── main.py                    # FastAPI application with /api/explain endpoint
│   ├── config.py                  # Pydantic settings from environment
│   │
│   ├── auth/
│   │   ├── __init__.py
│   │   └── firebase.py            # Firebase ID Token verification
│   │
│   ├── core/
│   │   ├── __init__.py
│   │   ├── result.py              # Result[T,E] type for error handling
│   │   ├── errors.py              # Domain errors & HTTP mapping
│   │   └── concurrency.py         # Executor strategy helpers
│   │
│   ├── schemas/
│   │   ├── __init__.py
│   │   ├── elements.py            # All element type schemas (11 types)
│   │   └── api.py                 # ExplainRequest/Response schemas
│   │
│   └── agents/
│       ├── __init__.py
│       ├── planner.py             # Decides topic & what to include
│       ├── math_solver.py         # SymPy-based math computation
│       ├── visuals.py             # Chart/diagram generation
│       ├── renderer.py            # Normalizes to Element objects
│       ├── critic.py              # Validates final output
│       └── orchestrator.py        # Coordinates all agents
│
├── tests/
│   ├── __init__.py
│   ├── test_elements.py           # Schema validation tests
│   ├── test_orchestrator.py       # Integration tests
│   ├── test_result.py             # Result type tests
│   └── test_concurrency.py        # Concurrency helper tests
│
├── requirements.txt               # Pinned dependencies
├── pytest.ini                     # Pytest configuration
├── .env.example                   # Environment variables template
├── .gitignore                     # Git ignore rules
├── README.md                      # Main documentation
├── API_USAGE.md                   # API documentation & examples
├── setup.sh                       # Setup script
└── run.sh                         # Run server script
```

## 🎯 Features Implemented

### ✅ Multi-Agent Pipeline

1. **PlannerAgent**: Analyzes query and decides content structure
2. **MathSolverAgent**: Uses SymPy for symbolic math computation
3. **VisualsAgent**: Generates charts (matplotlib) and diagram data
4. **RendererAgent**: Normalizes outputs to Element objects
5. **CriticAgent**: Validates final element list
6. **Orchestrator**: Coordinates all agents with proper concurrency

### ✅ Element Types (11 Total)

- `text_block` - Text content with title/caption
- `formula` - LaTeX and text formulas
- `example_steps` - Step-by-step solutions
- `bar_chart` - Bar charts (base64 PNG)
- `line_chart` - Line charts (base64 PNG)
- `long_division` - Long division steps
- `life_cycle` - Lifecycle diagrams
- `node_graph` - Graph with nodes and edges
- `hex_steps` - Hexagonal step layout
- `horizontal_blocks` - Horizontal block layout
- `pyramid` - Pyramid structure

### ✅ Firebase Authentication

- Firebase ID Token verification
- Automatic user extraction (uid, email, name)
- Proper 401 responses for auth failures
- Dependency injection for protected routes

### ✅ Error Handling & Concurrency

- **Result Pattern**: `Result[T, E]` for domain errors (no exceptions for normal flow)
- **Exception Types**:
  - Exceptions only for: invariants, security, non-recoverable faults, timeouts
  - Domain errors return Result for normal branching
- **Concurrency**:
  - ProcessPoolExecutor for CPU-bound (SymPy, matplotlib)
  - AsyncIO for I/O operations
  - Proper executor management in orchestrator

### ✅ Code Quality

- Python 3.11+ with full type annotations
- No global mutable state (except single Orchestrator instance)
- Small, focused functions following SRP
- Clean separation of concerns
- No TODOs - all working code

### ✅ Testing

- Element schema validation tests
- Orchestrator integration tests
- Result type unit tests
- Concurrency helper tests
- Pytest with asyncio support

## 🚀 Quick Start

### 1. Setup

```bash
./setup.sh
```

This will:

- Create virtual environment
- Install dependencies
- Create .env file from template

### 2. Configure Firebase

Edit `.env`:

```bash
FIREBASE_PROJECT_ID=your-project-id
GOOGLE_APPLICATION_CREDENTIALS=/path/to/serviceAccountKey.json
```

### 3. Run Server

```bash
./run.sh
```

Server starts at `http://localhost:8000`

### 4. Test

```bash
source venv/bin/activate
pytest tests/ -v
```

## 📡 API Endpoint

### POST /api/explain

**Authentication**: Required (Firebase ID Token)

**Request**:

```json
{
  "query": "Explain quadratic equations",
  "locale": "en"
}
```

**Response**:

```json
{
  "topic": "Quadratic Equations",
  "elements": [
    {
      "id": "elem_0",
      "type": "text_block",
      "order": 0,
      "title": "Introduction",
      "text": "A quadratic equation is..."
    },
    {
      "id": "elem_1",
      "type": "formula",
      "order": 1,
      "latex": "...",
      "text": "..."
    }
  ]
}
```

See `API_USAGE.md` for complete documentation.

## 🔧 Architecture Decisions

### Multi-Agent Design

Each agent has a single responsibility:

- **Planner**: What to include
- **MathSolver**: Math computation
- **Visuals**: Chart/diagram generation
- **Renderer**: Normalization
- **Critic**: Validation

Orchestrator coordinates them using async/await + ProcessPoolExecutor.

### Error Philosophy

- **Result Type**: For expected, recoverable errors
- **Exceptions**: Only for invariants, security, non-recoverable faults
- **HTTP Mapping**: Domain errors → 422, Auth errors → 401

### Concurrency Strategy

- **CPU-bound** (SymPy, matplotlib): ProcessPoolExecutor
- **I/O-bound** (Firebase auth, future DB): AsyncIO
- **FastAPI handlers**: async def with run_in_executor for CPU tasks

## 📦 Dependencies

All dependencies are pinned for reproducibility:

- `fastapi==0.109.0` - Web framework
- `uvicorn==0.27.0` - ASGI server
- `pydantic==2.5.3` - Data validation
- `sympy==1.12` - Symbolic math
- `matplotlib==3.8.2` - Chart rendering
- `numpy==1.26.3` - Numerical operations
- `networkx==3.2.1` - Graph algorithms
- `firebase-admin==6.4.0` - Firebase auth
- `pytest==7.4.3` - Testing

## 🎨 Design Patterns

1. **Result Pattern**: Explicit error handling without exceptions
2. **Dependency Injection**: FastAPI dependencies for auth
3. **Strategy Pattern**: Executor selection based on task type
4. **Pipeline Pattern**: Sequential agent execution
5. **Single Responsibility**: Each agent does one thing well

## 📝 Notes

- **Local Only**: No database, no deployment config
- **Stateless**: No global mutable state (orchestrator has immutable agents)
- **Type Safe**: Full type annotations throughout
- **Tested**: Comprehensive test coverage
- **Production Ready**: Proper error handling, logging, validation

## 🔍 Next Steps (Optional Extensions)

These are NOT required but could be added later:

1. **Caching**: Cache expensive SymPy computations
2. **Locale Support**: i18n for explanations
3. **Custom Visuals**: More chart types, animations
4. **Rate Limiting**: Protect against abuse
5. **Metrics**: Prometheus/OpenTelemetry
6. **Database**: Store explanations for reuse

## 📄 License & Credits

Built according to engineering rules:

- Error handling: Result pattern, minimal exceptions
- Concurrency: ProcessPool for CPU, AsyncIO for I/O
- Architecture: Multi-agent, single responsibility
- Testing: pytest with good coverage

No external code copied - all original implementation.
