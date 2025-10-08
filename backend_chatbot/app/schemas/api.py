"""API request and response schemas."""
from typing import Optional
from pydantic import BaseModel, Field
from app.schemas.elements import Element


class ExplainRequest(BaseModel):
    """Request schema for /api/explain endpoint."""

    query: str = Field(..., min_length=1, description="Math question or topic to explain")
    locale: Optional[str] = Field(default="en", description="Language locale for the explanation")
    model: Optional[str] = Field(default=None, description="LLM model to use: 'openai', 'gemini', or 'both'")


class ExplainResponse(BaseModel):
    """Response schema for /api/explain endpoint."""

    topic: str = Field(..., description="Main topic of the explanation")
    elements: list[Element] = Field(..., description="Ordered list of explanation elements")

