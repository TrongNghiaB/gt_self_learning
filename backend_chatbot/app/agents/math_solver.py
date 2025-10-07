"""Math Solver Agent - uses LLM for math explanations and SymPy for verification."""
import json
from dataclasses import dataclass
from typing import Optional
import sympy as sp
from sympy.parsing.sympy_parser import parse_expr, standard_transformations
from app.core.result import Result, Ok, Err
from app.core.errors import MathSolvingError
from app.core.llm_clients import get_openai_client, get_gemini_client
from app.config import settings


@dataclass(frozen=True)
class MathSolution:
    """Solution from the math solver."""

    explanation: str
    formula_latex: Optional[str]
    formula_text: Optional[str]
    example_steps: list[str]


class MathSolverAgent:
    """
    Uses LLM to generate math explanations, formulas, and examples.
    Can use SymPy for verification when needed.
    """

    async def solve(self, topic: str, query: str) -> Result[MathSolution, MathSolvingError]:
        """
        Generate math explanation using LLM.

        Args:
            topic: Main topic
            query: User's query

        Returns:
            Result containing MathSolution or MathSolvingError
        """
        try:
            prompt = self._create_math_prompt(topic, query)
            
            # Try primary model first
            if settings.primary_model in ["openai", "both"]:
                client = get_openai_client()
                result = await client.chat_completion(
                    messages=[
                        {
                            "role": "system",
                            "content": "You are an expert mathematics teacher. Explain concepts clearly with formulas and examples."
                        },
                        {
                            "role": "user",
                            "content": prompt
                        }
                    ],
                    temperature=0.7,
                    response_format={"type": "json_object"}
                )
                
                if result.is_ok():
                    return self._parse_llm_response(result.unwrap())
            
            # Fallback to Gemini
            if settings.primary_model in ["gemini", "both"]:
                client = get_gemini_client()
                result = await client.generate_content(prompt, temperature=0.7)
                
                if result.is_ok():
                    return self._parse_llm_response(result.unwrap())
            
            return Err(
                MathSolvingError(
                    message="Failed to generate math solution with LLM",
                    details={"topic": topic, "query": query},
                )
            )
        except Exception as e:
            return Err(
                MathSolvingError(
                    message=f"Failed to solve math problem: {str(e)}",
                    details={"topic": topic, "query": query},
                )
            )

    def _create_math_prompt(self, topic: str, query: str) -> str:
        """Create prompt for LLM to generate math content."""
        return f"""Generate a comprehensive math explanation for this query.

Topic: {topic}
Question: {query}

Provide:
1. A clear, educational explanation (2-4 paragraphs)
2. Relevant mathematical formulas (if applicable)
3. Step-by-step worked example (if applicable)

Return a JSON object with this structure:
{{
  "explanation": "Clear, detailed explanation text",
  "formula_latex": "LaTeX format formula (null if not applicable)",
  "formula_text": "Plain text formula (null if not applicable)",
  "example_steps": ["Step 1: ...", "Step 2: ...", "Step 3: ..."]
}}

Guidelines:
- Explanation should be clear and educational
- Formulas should be accurate and properly formatted
- Example should be realistic and helpful
- Use proper mathematical notation
- If no formula/example is needed, use null or empty array"""

    def _parse_llm_response(self, response: str) -> Result[MathSolution, MathSolvingError]:
        """Parse LLM JSON response into MathSolution."""
        try:
            # Extract JSON from response (handle markdown code blocks)
            response = response.strip()
            if response.startswith("```json"):
                response = response[7:]
            if response.startswith("```"):
                response = response[3:]
            if response.endswith("```"):
                response = response[:-3]
            response = response.strip()

            data = json.loads(response)
            
            return Ok(
                MathSolution(
                    explanation=data.get("explanation", ""),
                    formula_latex=data.get("formula_latex"),
                    formula_text=data.get("formula_text"),
                    example_steps=data.get("example_steps", []),
                )
            )
        except (json.JSONDecodeError, KeyError, TypeError) as e:
            return Err(
                MathSolvingError(
                    message=f"Failed to parse LLM response: {str(e)}",
                    details={"response": response[:200]},
                )
            )
