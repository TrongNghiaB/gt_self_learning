"""Application configuration."""
import os
from typing import Literal, Optional
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""

    # Firebase
    firebase_project_id: str = ""
    google_application_credentials: str = ""

    # LLM APIs
    openai_api_key: str = ""
    gemini_api_key: str = ""
    
    # Model selection
    primary_model: Literal["openai", "gemini", "both"] = "openai"

    class Config:
        env_file = ".env"
        case_sensitive = False


settings = Settings()

