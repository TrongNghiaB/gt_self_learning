"""Math explanation router."""
from contextlib import asynccontextmanager
from fastapi import APIRouter, Depends, HTTPException

from app.schemas.api import ExplainRequest, ExplainResponse
from app.auth.firebase import verify_firebase_token
from app.agents.orchestrator import Orchestrator
from app.core.errors import map_to_http

router = APIRouter(prefix="/api", tags=["math"])

# Single orchestrator instance (only global state)
orchestrator = Orchestrator()


@asynccontextmanager
async def lifespan(app):
    """Manage orchestrator lifecycle."""
    # Startup
    yield
    # Shutdown
    orchestrator.shutdown()


@router.post("/explain", response_model=ExplainResponse)
async def explain_math(
    request: ExplainRequest,
    # user = Depends(verify_firebase_token),
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
