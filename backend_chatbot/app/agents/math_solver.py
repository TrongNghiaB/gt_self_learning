"""Math Solver Agent - uses LLM for math explanations."""
import json
from typing import Optional
from pydantic import BaseModel
from app.core.result import Result, Ok, Err
from app.core.errors import MathSolvingError
from app.core.llm_clients import get_openai_client, get_gemini_client


class MathSolution(BaseModel):
    """Solution from the math solver."""

    final_answer: str
    explanation: str
    formula_latex: Optional[str] = None
    formula_text: Optional[str] = None
    solution_steps: list[dict[str, str]]  # [{"step_num": "1", "step_text": "..."}]


class MathSolverAgent:
    """
    Uses LLM to generate math explanations, formulas, and examples.
    Can use SymPy for verification when needed.
    """

    async def solve(self, topic: str, query: str, model: str, image_paths: list[str] = None) -> Result[MathSolution, MathSolvingError]:
        """
        Generate math explanation using LLM.

        Args:
            topic: Main topic
            query: User's query
            model: LLM model to use
            image_paths: Optional list of image paths for visual analysis

        Returns:
            Result containing MathSolution or MathSolvingError
        """
        try:
            prompt = self._create_math_prompt(topic, query, image_paths)
            
            messages = [
                {
                    "role": "system",
                    "content": "You are an expert mathematics tutor specializing in solving specific mathematical problems. When images are provided, you must carefully examine them to identify and solve the exact mathematical problem shown. Focus on providing complete solutions with step-by-step explanations, not generic educational content."
                },
                {
                    "role": "user",
                    "content": prompt
                }
            ]
            
            # Try primary model first
            if model == "openai":
                client = get_openai_client()
                result = await client.chat_completion_structured(
                    messages=messages,
                    response_model=MathSolution,
                    temperature=0.7,
                    image_paths=image_paths
                )
                
                if result.is_ok():
                    return Ok(result.unwrap())
            
            # Fallback to Gemini
            if model == "gemini":
                client = get_gemini_client()
                result = await client.chat_structured(
                    messages=messages,
                    response_model=MathSolution,
                    temperature=0.7
                )
                
                if result.is_ok():
                    return Ok(result.unwrap())
            
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

    def _create_math_prompt(self, topic: str, query: str, image_paths: list[str] = None) -> str:
        """Create prompt for LLM to generate math content."""
        image_context = ""
        if image_paths:
            image_context = f"""

CRITICAL: The user has provided {len(image_paths)} image(s) containing a mathematical problem or question. 
You MUST:
1. Carefully examine the image(s) to identify the specific mathematical problem shown
2. Extract any numbers, equations, diagrams, or mathematical expressions visible in the image
3. Focus your explanation on solving the EXACT problem shown in the image(s)
4. If the image shows a specific equation like "(2+3)^2 = ?", solve that exact equation
5. If the image shows a word problem, solve that specific word problem
6. Do NOT give generic explanations about visual data representations

The image(s) contain the actual math problem to solve. Your response should be a direct solution to what's shown in the image(s)."""
        
        return f"""You are an expert mathematics tutor. Solve this specific mathematical problem:

Question: {query}{image_context}

Your task is to provide a complete mathematical solution with:
1. The final answer (numerical result if applicable)
2. Step-by-step solution process
3. Clear explanations for each step
4. Any relevant formulas or mathematical concepts used

Return a JSON object with this structure:
{{
  "final_answer": "The exact numerical answer or final result",
  "explanation": "Complete solution explanation",
  "formula_latex": "LaTeX format of any formulas used (null if not applicable)",
  "formula_text": "Plain text version of formulas (null if not applicable)",
  "solution_steps": [
    {{"step_num": "1", "step_text": "Identify the problem and what needs to be solved"}},
    {{"step_num": "2", "step_text": "Apply the appropriate method or formula"}},
    {{"step_num": "3", "step_text": "Perform calculations step by step"}},
    {{"step_num": "4", "step_text": "State the final answer"}}
  ]
}}

CRITICAL REQUIREMENTS:
- If images are provided, you MUST analyze them to find the specific mathematical problem
- Extract numbers, equations, or mathematical expressions from the images
- Solve the EXACT problem shown in the images, not a generic example
- Provide the precise numerical answer
- Each step should be clear and specific to the problem
- Use proper mathematical notation"""

