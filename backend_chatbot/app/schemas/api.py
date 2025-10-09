"""API request and response schemas."""
from typing import Optional, List
from datetime import datetime
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


class ConversationSummary(BaseModel):
    """Summary of a conversation for listing."""

    id: str = Field(..., description="Unique conversation ID")
    topic: str = Field(..., description="Main topic of the conversation")
    created_at: datetime = Field(..., description="When the conversation was created")
    updated_at: datetime = Field(..., description="When the conversation was last updated")
    image_count: int = Field(..., description="Number of images in the conversation")


class ConversationDetail(BaseModel):
    """Detailed conversation information."""

    id: str = Field(..., description="Unique conversation ID")
    topic: str = Field(..., description="Main topic of the conversation")
    query: str = Field(..., description="Original user query")
    elements: list[Element] = Field(..., description="Ordered list of explanation elements")
    image_paths: List[str] = Field(..., description="List of uploaded image paths")
    created_at: datetime = Field(..., description="When the conversation was created")
    updated_at: datetime = Field(..., description="When the conversation was last updated")

