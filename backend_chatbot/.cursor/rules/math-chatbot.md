# Cursor Project Rules — Math Explainer (Python/FastAPI, Multi-Agent)

## Goals

- Build a local FastAPI backend that explains math concepts via a Multi-Agent pipeline.
- Output is an ordered list of elements (text + visuals) top→bottom.
- Visuals supported: bar_chart, line_chart, long_division, life_cycle, node_graph, hex_steps, horizontal_blocks, pyramid.

## Architecture

- app/schemas: Pydantic models for requests/responses/elements.
- app/agents: Planner, MathSolver (SymPy), Visuals (chart specs & data), Renderer (base64 PNG for charts, JSON for others), Critic, Orchestrator.
- app/main.py: FastAPI with /api/explain.

## Coding Standards

- Python 3.11+, type hints everywhere, small functions, SRP.
- No global state except a single Orchestrator instance in main.py.
- Matplotlib only for charts, embedded as base64.
- Avoid heavy external deps; keep it simple, testable.
- Lint: black/ruff (optional), but keep style consistent.

## Tests (light)

- tests/test_elements.py: validate schemas.
- tests/test_orchestrator.py: simple e2e call returns at least 1 text_block.

## Non-Goals

- No database, no auth, no deployment.
- No frontend; backend returns clean JSON.

## Acceptance

- `uvicorn app.main:app --reload` starts.
- POST /api/explain returns ordered elements with correct types.
