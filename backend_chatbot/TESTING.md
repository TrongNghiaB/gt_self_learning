# Testing Guide

## Running Tests

### All Tests

```bash
source venv/bin/activate
pytest tests/ -v
```

### Specific Test File

```bash
pytest tests/test_orchestrator.py -v
```

### With Coverage

```bash
pip install pytest-cov
pytest tests/ -v --cov=app --cov-report=html
```

## Manual API Testing

### 1. Start the Server

```bash
./run.sh
```

### 2. Check Health Endpoint (No Auth Required)

```bash
curl http://localhost:8000/health
```

Expected response:

```json
{ "status": "healthy" }
```

### 3. Test Protected Endpoint (Requires Firebase Token)

First, get a Firebase ID token from your frontend or Firebase Console.

```bash
export FIREBASE_TOKEN="your_firebase_id_token_here"

curl -X POST http://localhost:8000/api/explain \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -d '{
    "query": "Explain quadratic equations",
    "locale": "en"
  }'
```

### 4. Test Without Authentication (Should Fail)

```bash
curl -X POST http://localhost:8000/api/explain \
  -H "Content-Type: application/json" \
  -d '{
    "query": "Explain quadratic equations",
    "locale": "en"
  }'
```

Expected response (401):

```json
{
  "detail": "Missing authentication token"
}
```

## Sample Queries

### Basic Math Concepts

```bash
# Quadratic equations
curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "Explain quadratic equations"}'

# Derivatives
curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "What is a derivative?"}'

# Pythagorean theorem
curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "Explain the Pythagorean theorem"}'
```

### With Visuals

```bash
# Graph (triggers line_chart)
curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "Graph quadratic functions"}'

# Division (triggers long_division)
curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "How to do long division"}'

# Steps (triggers hex_steps)
curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "Step by step guide to solving equations"}'
```

## Test Results Validation

### Successful Response Structure

Every successful response should have:

1. **topic**: Non-empty string
2. **elements**: Array with at least 1 element
3. **At least one text_block**: Required by CriticAgent
4. **Ordered elements**: `element.order` should be sequential (0, 1, 2, ...)
5. **Unique IDs**: All `element.id` should be unique

### Element Validation

Each element should have:

- `id`: String (e.g., "elem_0")
- `type`: One of the 11 valid types
- `order`: Integer (sequential)
- `title`: Optional string
- `caption`: Optional string
- Type-specific fields (e.g., `text` for text_block, `latex` for formula)

## Integration Tests

The orchestrator tests cover:

- ✅ Basic query processing
- ✅ Formula generation
- ✅ Example steps generation
- ✅ Visual generation
- ✅ Empty query handling (error case)
- ✅ Multiple sequential queries
- ✅ Element uniqueness validation

## Unit Tests

Individual component tests:

- ✅ Element schema validation (all 11 types)
- ✅ Result type operations (Ok/Err)
- ✅ Executor strategy selection
- ✅ Domain error types

## Performance Testing

### Single Request Timing

```bash
time curl -X POST http://localhost:8000/api/explain \
  -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"query": "Explain quadratic equations"}'
```

Expected: < 5 seconds (includes SymPy computation and matplotlib rendering)

### Concurrent Requests

```bash
# Install Apache Bench or use wrk
ab -n 10 -c 2 -H "Authorization: Bearer $FIREBASE_TOKEN" \
  -p query.json -T application/json \
  http://localhost:8000/api/explain
```

Where `query.json`:

```json
{ "query": "Explain quadratic equations", "locale": "en" }
```

## Debugging

### Enable Debug Logging

Add to `.env`:

```
LOG_LEVEL=DEBUG
```

### Run with Reload (Development)

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000 --log-level debug
```

### Python Debugger

Add breakpoint in code:

```python
import pdb; pdb.set_trace()
```

Then run tests:

```bash
pytest tests/test_orchestrator.py -s
```

## Common Issues

### 1. Firebase Auth Fails

**Symptom**: 401 errors even with token

**Solution**:

- Check `FIREBASE_PROJECT_ID` in `.env`
- Verify `GOOGLE_APPLICATION_CREDENTIALS` path is correct
- Ensure service account JSON file exists and is valid
- Check token is not expired (tokens expire after 1 hour)

### 2. Process Pool Hangs

**Symptom**: Requests hang indefinitely

**Solution**:

- Check for infinite loops in SymPy computations
- Ensure matplotlib backend is "Agg" (non-interactive)
- Restart server to reset process pool

### 3. Import Errors

**Symptom**: ModuleNotFoundError

**Solution**:

```bash
source venv/bin/activate
pip install -r requirements.txt
```

### 4. Tests Fail

**Symptom**: Pytest failures

**Solution**:

- Ensure virtual environment is activated
- Check Python version (3.11+)
- Run with `-v` flag for detailed output
- Check for missing dependencies

## Test Coverage Goals

Aim for:

- ✅ Core utilities: 100%
- ✅ Schemas: 100%
- ✅ Agents: 80%+
- ✅ Integration: Key paths covered

Run coverage report:

```bash
pytest tests/ --cov=app --cov-report=term-missing
```
