"""LLM client wrappers for OpenAI and Gemini."""
import json
from typing import Any, Optional
from openai import AsyncOpenAI
import google.generativeai as genai

from app.config import settings
from app.core.result import Result, Ok, Err
from app.core.errors import DomainError


class LLMError(DomainError):
    """Error from LLM API call."""
    pass


class OpenAIClient:
    """Wrapper for OpenAI API."""

    def __init__(self, api_key: Optional[str] = None):
        """Initialize OpenAI client."""
        self.api_key = api_key or settings.openai_api_key
        self.client = AsyncOpenAI(api_key=self.api_key) if self.api_key else None

    async def chat_completion(
        self,
        messages: list[dict[str, str]],
        model: str = "gpt-4-turbo-preview",
        temperature: float = 0.7,
        response_format: Optional[dict[str, str]] = None,
    ) -> Result[str, LLMError]:
        """
        Call OpenAI chat completion.

        Args:
            messages: List of message dicts with 'role' and 'content'
            model: Model name (default: gpt-4-turbo-preview)
            temperature: Sampling temperature (0-2)
            response_format: Optional response format (e.g., {"type": "json_object"})

        Returns:
            Result containing response text or LLMError
        """
        if not self.client:
            return Err(LLMError(message="OpenAI API key not configured"))

        try:
            kwargs: dict[str, Any] = {
                "model": model,
                "messages": messages,
                "temperature": temperature,
            }
            
            if response_format:
                kwargs["response_format"] = response_format

            response = await self.client.chat.completions.create(**kwargs)
            
            content = response.choices[0].message.content
            if not content:
                return Err(LLMError(message="Empty response from OpenAI"))

            return Ok(content)

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
            self.model = genai.GenerativeModel('gemini-pro')
        else:
            self.model = None

    async def generate_content(
        self,
        prompt: str,
        temperature: float = 0.7,
    ) -> Result[str, LLMError]:
        """
        Generate content using Gemini.

        Args:
            prompt: Text prompt
            temperature: Sampling temperature (0-1)

        Returns:
            Result containing response text or LLMError
        """
        if not self.model:
            return Err(LLMError(message="Gemini API key not configured"))

        try:
            generation_config = {
                "temperature": temperature,
                "top_p": 0.95,
                "top_k": 40,
                "max_output_tokens": 8192,
            }

            response = await self.model.generate_content_async(
                prompt,
                generation_config=generation_config,
            )

            if not response.text:
                return Err(LLMError(message="Empty response from Gemini"))

            return Ok(response.text)

        except Exception as e:
            return Err(
                LLMError(
                    message=f"Gemini API error: {str(e)}",
                    details={"model": "gemini-pro"},
                )
            )

    async def chat(
        self,
        messages: list[dict[str, str]],
        temperature: float = 0.7,
    ) -> Result[str, LLMError]:
        """
        Chat completion using Gemini (converts messages to prompt).

        Args:
            messages: List of message dicts with 'role' and 'content'
            temperature: Sampling temperature (0-1)

        Returns:
            Result containing response text or LLMError
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
        return await self.generate_content(prompt, temperature)


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

