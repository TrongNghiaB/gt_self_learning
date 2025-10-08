"""LLM client wrappers for OpenAI and Gemini."""
import json
from typing import Any, Optional
from openai import AsyncOpenAI, OpenAI
import google.generativeai as genai

from app.config import settings
from app.core.result import Result, Ok, Err
from app.core.errors import DomainError


class LLMError(DomainError):
    """Error from LLM API call."""
    pass


class OpenAIClient:
    """Wrapper for OpenAI API."""

    def __init__(self):
        """Initialize OpenAI client."""
        self.api_key = settings.openai_api_key
        self.async_client = AsyncOpenAI(api_key=self.api_key) if self.api_key else None
        self.sync_client = OpenAI(api_key=self.api_key) if self.api_key else None

    async def chat_completion_structured(
        self,
        messages: list[dict[str, str]],
        response_model: type,
        model: str = "gpt-4o-mini",
        temperature: float = 0.7,
    ) -> Result[any, LLMError]:
        """
        Call OpenAI chat completion with structured output using Pydantic model.

        Args:
            messages: List of message dicts with 'role' and 'content'
            response_model: Pydantic model class for structured output
            model: Model name (default: gpt-4o-mini)
            temperature: Sampling temperature (0-2)

        Returns:
            Result containing parsed Pydantic model or LLMError
        """
        if not self.async_client:
            return Err(LLMError(message="OpenAI API key not configured"))

        try:
            # Use traditional chat completion with JSON mode
            response = await self.async_client.chat.completions.create(
                model=model,
                messages=messages,
                temperature=temperature,
                response_format={"type": "json_object"}
            )
            
            content = response.choices[0].message.content
            if not content:
                return Err(LLMError(message="Empty response from OpenAI"))

            # Parse JSON and create Pydantic model
            import json
            data = json.loads(content)
            parsed_model = response_model(**data)
            return Ok(parsed_model)

        except Exception as e:
            return Err(
                LLMError(
                    message=f"OpenAI API error: {str(e)}",
                    details={"model": model},
                )
            )


class GeminiClient:
    """Wrapper for Google Gemini API."""

    def __init__(self, api_key: Optional[str] = None):
        """Initialize Gemini client."""
        self.api_key = api_key or settings.gemini_api_key
        if self.api_key:
            genai.configure(api_key=self.api_key)
            self.model = genai.GenerativeModel('gemini-2.5-flash')
        else:
            self.model = None

    async def generate_content_structured(
        self,
        prompt: str,
        response_model: type,
        temperature: float = 0.7,
    ) -> Result[any, LLMError]:
        """
        Generate structured content using Gemini with Pydantic model.

        Args:
            prompt: Text prompt
            response_model: Pydantic model class for structured output
            temperature: Sampling temperature (0-1)

        Returns:
            Result containing parsed Pydantic model or LLMError
        """
        if not self.model:
            return Err(LLMError(message="Gemini API key not configured"))

        try:
            generation_config = {
                "temperature": temperature,
                "response_mime_type": "application/json",
                "response_schema": response_model,
            }

            response = await self.model.generate_content_async(
                prompt,
                generation_config=generation_config,
            )

            if not response.text:
                return Err(LLMError(message="Empty response from Gemini"))

            # Parse JSON response into Pydantic model
            import json
            data = json.loads(response.text)
            parsed_model = response_model(**data)
            return Ok(parsed_model)

        except Exception as e:
            return Err(
                LLMError(
                    message=f"Gemini API error: {str(e)}",
                    details={"model": "gemini-2.5-flash"},
                )
            )

    async def chat_structured(
        self,
        messages: list[dict[str, str]],
        response_model: type,
        temperature: float = 0.7,
    ) -> Result[any, LLMError]:
        """
        Chat completion using Gemini with structured output.

        Args:
            messages: List of message dicts with 'role' and 'content'
            response_model: Pydantic model class for structured output
            temperature: Sampling temperature (0-1)

        Returns:
            Result containing parsed Pydantic model or LLMError
        """
        # Convert OpenAI-style messages to Gemini prompt
        prompt_parts = []
        for msg in messages:
            role = msg.get("role", "user")
            content = msg.get("content", "")
            
            if role == "system":
                prompt_parts.append(f"System: {content}")
            elif role == "user":
                prompt_parts.append(f"User: {content}")
            elif role == "assistant":
                prompt_parts.append(f"Assistant: {content}")

        prompt = "\n\n".join(prompt_parts)
        return await self.generate_content_structured(prompt, response_model, temperature)


# Global instances (lazy initialized)
_openai_client: Optional[OpenAIClient] = None
_gemini_client: Optional[GeminiClient] = None


def get_openai_client() -> OpenAIClient:
    """Get or create OpenAI client instance."""
    global _openai_client
    if _openai_client is None:
        _openai_client = OpenAIClient()
    return _openai_client


def get_gemini_client() -> GeminiClient:
    """Get or create Gemini client instance."""
    global _gemini_client
    if _gemini_client is None:
        _gemini_client = GeminiClient()
    return _gemini_client

