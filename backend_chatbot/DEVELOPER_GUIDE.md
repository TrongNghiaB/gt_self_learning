# Developer Guide

## 🏗️ Architecture Overview

### Multi-Agent System

The backend uses a sophisticated multi-agent pipeline where each agent has a single responsibility:

1. **PlannerAgent**: Analyzes user query and decides what content to include
2. **MathSolverAgent**: Uses LLMs to generate math explanations and formulas
3. **VisualsAgent**: Prepares data and renders charts/diagrams using matplotlib
4. **RendererAgent**: Normalizes outputs to standardized Element objects
5. **CriticAgent**: Validates final element list for quality
6. **Orchestrator**: Coordinates all agents with proper concurrency

### Technology Stack

- **FastAPI**: Modern, fast web framework for building APIs
- **Pydantic v2**: Data validation and settings management
- **SymPy**: Symbolic mathematics library
- **Matplotlib**: Chart and diagram generation
- **NumPy**: Numerical operations
- **NetworkX**: Graph algorithms
- **Firebase Admin**: Authentication verification
- **OpenAI API**: GPT-4 for intelligent content generation
- **Google Gemini**: Alternative LLM with fallback support

## 🔧 Development Setup

### Virtual Environment

The project uses a virtual environment to isolate dependencies:

```bash
# Virtual environment location
/Users/te-member/gt_self_learning/backend_chatbot/venv/

# Python in venv
/Users/te-member/gt_self_learning/backend_chatbot/venv/bin/python
```

### Daily Development Workflow

```bash
# 1. Navigate to project
cd /Users/te-member/gt_self_learning/backend_chatbot

# 2. Run server (auto-activates venv)
./run_local.sh

# 3. Manual commands (if needed)
source venv/bin/activate          # Activate venv
uvicorn app.main:app --reload     # Run server
deactivate                        # Deactivate venv
```

### Adding Dependencies

```bash
# Activate venv first
source venv/bin/activate

# Install new package
pip install package-name

# Update requirements.txt
pip freeze > requirements.txt
```

## 🎯 Code Architecture

### Error Handling Philosophy

The project follows a strict error handling philosophy:

#### Result Pattern for Domain Errors

```python
from app.core.result import Result
from app.core.errors import DomainError

# For expected, recoverable conditions
def process_data(data: str) -> Result[ProcessedData, ProcessingError]:
    if not data:
        return Result.error(ProcessingError("Data cannot be empty"))

    # Process data...
    return Result.success(processed_data)
```

#### Exceptions Only for Invariants

```python
# Only raise exceptions for:
# - Invariants (programmer errors)
# - Security violations
# - Non-recoverable faults
# - Cancellations/timeouts
# - Input validation at boundaries

def validate_input(data: dict) -> None:
    if not isinstance(data, dict):
        raise ValueError("Input must be a dictionary")
```

### Concurrency Strategy

The system uses different executors based on task type:

#### CPU-Bound Tasks (SymPy, Matplotlib)

```python
from concurrent.futures import ProcessPoolExecutor
from app.core.concurrency import get_cpu_executor

# For SymPy computations and matplotlib rendering
with get_cpu_executor() as executor:
    result = await loop.run_in_executor(executor, cpu_intensive_function, data)
```

#### I/O-Bound Tasks (API calls, Firebase)

```python
import asyncio

# For API calls and Firebase operations
async def fetch_data():
    async with httpx.AsyncClient() as client:
        response = await client.get("https://api.example.com/data")
        return response.json()
```

### Multi-Agent Coordination

The Orchestrator coordinates all agents with proper error handling:

```python
class Orchestrator:
    async def explain(self, query: str, locale: str = "en") -> Result[tuple[str, list[Element]], DomainError]:
        # Step 1: Planning (LLM-based, async)
        plan_result = await self.planner.plan(query, locale)
        if plan_result.is_error:
            return Result.error(plan_result.error)

        # Step 2: Math solving (LLM-based, async)
        math_solution_result = await self.math_solver.solve(plan.topic, query)
        if math_solution_result.is_error:
            return Result.error(math_solution_result.error)

        # Step 3: Visuals (CPU-bound, process pool)
        visuals_result = await self._generate_visuals(plan, math_solution)

        # Step 4: Rendering (CPU-bound, process pool)
        elements_result = await self._render_elements(plan, math_solution, visuals)

        # Step 5: Validation
        validation_result = self.critic.validate(elements)

        return Result.success((plan.topic, elements))
```

## 🧪 Testing

### Test Structure

```
tests/
├── __init__.py
├── test_elements.py           # Schema validation tests
├── test_orchestrator.py       # Integration tests
├── test_result.py             # Result type tests
└── test_concurrency.py        # Concurrency helper tests
```

### Running Tests

```bash
# Run all tests
pytest tests/ -v

# Run specific test file
pytest tests/test_elements.py -v

# Run with coverage
pytest tests/ --cov=app
```

### Test Configuration

The `pytest.ini` file configures test discovery:

```ini
[pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
asyncio_mode = auto
```

## 📦 Dependencies

All dependencies are pinned for reproducibility:

```txt
fastapi==0.109.0
uvicorn==0.27.0
pydantic==2.5.3
sympy==1.12
matplotlib==3.8.2
numpy==1.26.3
networkx==3.2.1
firebase-admin==6.4.0
openai==1.12.0
google-generativeai==0.3.2
httpx==0.26.0
pytest==7.4.3
```

## 🔍 Code Quality

### Type Annotations

All functions must have complete type annotations:

```python
from typing import Optional, List, Dict, Any
from app.core.result import Result
from app.core.errors import DomainError

async def process_request(
    data: Dict[str, Any],
    user_id: str,
    options: Optional[Dict[str, Any]] = None
) -> Result[ProcessedResponse, DomainError]:
    # Implementation...
```

### Single Responsibility Principle

Each agent has one clear responsibility:

- **PlannerAgent**: Only decides what content to include
- **MathSolverAgent**: Only generates math explanations
- **VisualsAgent**: Only creates charts and diagrams
- **RendererAgent**: Only normalizes to Element objects
- **CriticAgent**: Only validates output quality

### No Global Mutable State

The only global state is the single Orchestrator instance, which contains immutable agent instances:

```python
# ✅ Good: Immutable orchestrator
orchestrator = Orchestrator()

# ❌ Bad: Global mutable state
global_cache = {}
global_counter = 0
```

## 🚀 Performance Considerations

### Async/Await Usage

Use async/await for I/O operations:

```python
async def fetch_user_data(user_id: str) -> UserData:
    async with httpx.AsyncClient() as client:
        response = await client.get(f"/api/users/{user_id}")
        return UserData.from_dict(response.json())
```

### Process Pool for CPU Tasks

Use ProcessPoolExecutor for CPU-intensive tasks:

```python
async def generate_chart(data: ChartData) -> str:
    loop = asyncio.get_event_loop()
    with ProcessPoolExecutor() as executor:
        result = await loop.run_in_executor(
            executor,
            _render_chart_sync,
            data
        )
    return result
```

### Memory Management

- Use generators for large datasets
- Clear matplotlib figures after rendering
- Avoid storing large objects in memory

## 🔧 Configuration

### Environment Variables

All configuration is handled through environment variables:

```python
from pydantic import BaseSettings
from typing import Literal

class Settings(BaseSettings):
    # Firebase
    firebase_project_id: str
    google_application_credentials: str

    # LLM APIs
    openai_api_key: str = ""
    gemini_api_key: str = ""

    # Model selection
    primary_model: Literal["openai", "gemini", "both"] = "openai"

    class Config:
        env_file = ".env"
```

### API Keys Management

- Store API keys in `.env` file
- Never commit API keys to version control
- Use environment-specific configurations

## 📝 Development Best Practices

### Code Organization

- Keep functions small and focused
- Use descriptive names
- Add docstrings for complex functions
- Follow PEP 8 style guidelines

### Error Handling

- Use Result pattern for domain errors
- Raise exceptions only for invariants
- Provide meaningful error messages
- Log errors appropriately

### Testing

- Write tests for all public functions
- Test both success and error cases
- Use descriptive test names
- Mock external dependencies

### Documentation

- Keep README.md up to date
- Document API changes
- Add inline comments for complex logic
- Update examples when changing APIs

## 🎯 Future Extensions

Potential areas for enhancement:

1. **Caching**: Cache expensive SymPy computations
2. **Rate Limiting**: Protect against API abuse
3. **Metrics**: Add Prometheus/OpenTelemetry
4. **Database**: Store explanations for reuse
5. **Custom Visuals**: Add more chart types
6. **Internationalization**: Support multiple languages

## 📞 Getting Help

- Check existing tests for usage examples
- Review error messages for debugging hints
- Use type hints for better IDE support
- Follow the established patterns in the codebase
