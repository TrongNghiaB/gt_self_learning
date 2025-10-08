"""FastAPI main application."""
from contextlib import asynccontextmanager
from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware

from app.schemas.api import ExplainRequest, ExplainResponse
from app.auth.firebase import CurrentUser
from app.agents.orchestrator import Orchestrator
from app.core.errors import map_to_http


# Single orchestrator instance (only global state)
orchestrator = Orchestrator()


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Manage application lifecycle."""
    # Startup
    yield
    # Shutdown
    orchestrator.shutdown()


# Create FastAPI app
app = FastAPI(
    title="Math Explainer API",
    description="Multi-Agent Math Explanation System with Firebase Auth",
    version="1.0.0",
    lifespan=lifespan,
)

# CORS middleware for frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure this properly in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    """Health check endpoint."""
    return {"status": "ok", "service": "Math Explainer API"}


@app.get("/health")
async def health():
    """Health check endpoint."""
    return {"status": "healthy"}


@app.post("/api/explain", response_model=ExplainResponse)
async def explain(
    request: ExplainRequest,
    # user: CurrentUser,
) -> ExplainResponse:
    """
    Explain a math concept using multi-agent pipeline.

    Protected endpoint - requires valid Firebase ID token.

    Args:
        request: ExplainRequest with query and optional locale
        user: Authenticated Firebase user (injected by dependency)

    Returns:
        ExplainResponse with topic and ordered elements

    Raises:
        HTTPException: 422 if processing fails
    """
    # Execute the multi-agent pipeline
    result = await orchestrator.explain(
        query=request.query, locale=request.locale or "en", model=request.model
    )

    # Handle result
    if result.is_err():
        error = result.error  # type: ignore
        raise map_to_http(error)

    topic, elements = result.unwrap()

    return ExplainResponse(topic=topic, elements=elements)

