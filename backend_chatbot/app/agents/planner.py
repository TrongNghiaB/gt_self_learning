"""Planner Agent - decides topic and which sections/visuals to include."""
import json
from dataclasses import dataclass
from typing import Optional
from app.core.result import Result, Ok, Err
from app.core.errors import PlanningError
from app.core.llm_clients import get_openai_client, get_gemini_client
from app.config import settings


@dataclass(frozen=True)
class Plan:
    """Plan for explaining a math topic."""

    topic: str
    needs_intro: bool
    needs_formula: bool
    needs_example: bool
    visual_types: list[str]  # e.g., ["bar_chart", "node_graph"]


class PlannerAgent:
    """
    Analyzes the query using LLM and decides what content to include.
    """

    async def plan(self, query: str, locale: str, model: Optional[str] = None) -> Result[Plan, PlanningError]:
        """
        Create a plan for explaining the given query using LLM.

        Args:
            query: User's math question
            locale: Language locale

        Returns:
            Result containing Plan or PlanningError
        """
        if not query or not query.strip():
            return Err(PlanningError(message="Query cannot be empty"))

        # Use LLM to create intelligent plan
        prompt = self._create_planning_prompt(query, locale)
        
        # Try primary model first
        if settings.primary_model in ["openai", "both"]:
            client = get_openai_client()
            result = await client.chat_completion(
                messages=[
                    {
                        "role": "system",
                        "content": "You are a math education expert. Analyze queries and create structured learning plans."
                    },
                    {
                        "role": "user",
                        "content": prompt
                    }
                ],
                temperature=0.3,
                response_format={"type": "json_object"}
            )
            
            if result.is_ok():
                return self._parse_llm_response(result.unwrap())
        
        # Fallback to Gemini if OpenAI fails or if Gemini is primary
        if settings.primary_model in ["gemini", "both"]:
            client = get_gemini_client()
            result = await client.generate_content(prompt, temperature=0.3)
            
            if result.is_ok():
                return self._parse_llm_response(result.unwrap())
        
        # If both fail, return error
        return Err(PlanningError(message="Failed to create plan with LLM"))

    def _create_planning_prompt(self, query: str, locale: str) -> str:
        """Create prompt for LLM to generate plan."""
        return f"""Analyze this math question and create a structured learning plan.

Question: {query}
Language: {locale}

Available visual types:
- bar_chart: For comparisons, data visualization
- line_chart: For functions, graphs, trends
- long_division: For division problems step-by-step
- life_cycle: For processes, stages, cycles
- node_graph: For relationships, connections, graph theory
- hex_steps: For procedures, methods, step-by-step guides (hexagonal layout)
- horizontal_blocks: For sequential concepts, progression
- pyramid: For hierarchies, levels, building blocks

Return a JSON object with this structure:
{{
  "topic": "Clear, concise topic title",
  "needs_intro": true/false,
  "needs_formula": true/false (if mathematical formulas are relevant),
  "needs_example": true/false (if worked examples would help),
  "visual_types": ["list", "of", "relevant", "visual", "types"]
}}

Choose visuals that will genuinely help explain this specific concept. Be selective - only include visuals that add value."""

    def _parse_llm_response(self, response: str) -> Result[Plan, PlanningError]:
        """Parse LLM JSON response into Plan."""
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
                Plan(
                    topic=data.get("topic", "Mathematics"),
                    needs_intro=data.get("needs_intro", True),
                    needs_formula=data.get("needs_formula", False),
                    needs_example=data.get("needs_example", False),
                    visual_types=data.get("visual_types", []),
                )
            )
        except (json.JSONDecodeError, KeyError, TypeError) as e:
            return Err(
                PlanningError(
                    message=f"Failed to parse LLM response: {str(e)}",
                    details={"response": response[:200]},
                )
            )

