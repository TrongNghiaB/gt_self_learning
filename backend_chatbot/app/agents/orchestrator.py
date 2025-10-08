"""Orchestrator - coordinates all agents in the pipeline."""
import asyncio
from concurrent.futures import ProcessPoolExecutor
from typing import Any, Optional
from app.core.result import Result, Ok, Err
from app.core.errors import DomainError, InvariantError
from app.core.concurrency import create_process_pool
from app.schemas.elements import Element
from app.agents.planner import PlannerAgent, Plan
from app.agents.math_solver import MathSolverAgent, MathSolution
from app.agents.visuals import VisualsAgent
from app.agents.renderer import RendererAgent
from app.agents.critic import CriticAgent


class Orchestrator:
    """
    Coordinates the multi-agent pipeline.
    
    Pipeline flow:
    1. PlannerAgent → decide what to include
    2. MathSolverAgent → compute math content
    3. VisualsAgent → generate visualizations
    4. RendererAgent → normalize to elements
    5. CriticAgent → validate output
    """

    def __init__(self):
        """Initialize orchestrator with all agents."""
        self.planner = PlannerAgent()
        self.math_solver = MathSolverAgent()
        self.visuals = VisualsAgent()
        self.renderer = RendererAgent()
        self.critic = CriticAgent()
        self.process_pool: ProcessPoolExecutor | None = None

    def _ensure_process_pool(self) -> ProcessPoolExecutor:
        """Lazy initialization of process pool."""
        if self.process_pool is None:
            self.process_pool = create_process_pool()
        return self.process_pool

    async def explain(
        self, query: str, locale: str = "en", model: str = "openai"
    ) -> Result[tuple[str, list[Element]], DomainError]:
        """
        Execute the full pipeline to generate explanation elements.

        Args:
            query: User's math question
            locale: Language locale

        Returns:
            Result containing (topic, elements) or DomainError
        """
        # Step 1: Planning (LLM-based, async)
        plan_result = await self.planner.plan(query, locale, model)
        if plan_result.is_err():
            return plan_result  # type: ignore

        plan: Plan = plan_result.unwrap()

        # Step 2: Math solving (LLM-based, async)
        math_solution_result = await self.math_solver.solve(plan.topic, query, model)
        if math_solution_result.is_err():
            return math_solution_result  # type: ignore

        math_solution: MathSolution = math_solution_result.unwrap()

        # Step 3: Generate visuals (CPU-bound for chart rendering)
        visuals_result = await self._generate_visuals(plan, query)
        if visuals_result.is_err():
            return visuals_result  # type: ignore

        visuals_data: dict[str, Any] = visuals_result.unwrap()

        # Step 4: Render elements (fast)
        render_result = self.renderer.render_elements(plan, math_solution, visuals_data)
        if render_result.is_err():
            return render_result  # type: ignore

        elements: list[Element] = render_result.unwrap()

        # Step 5: Validation
        validation_result = self.critic.validate(elements)
        if validation_result.is_err():
            return validation_result  # type: ignore

        validated_elements: list[Element] = validation_result.unwrap()

        return Ok((plan.topic, validated_elements))

    async def _generate_visuals(
        self, plan: Plan, query: str
    ) -> Result[dict[str, Any], DomainError]:
        """
        Generate all requested visuals, running chart rendering in process pool.
        """
        visuals_data: dict[str, Any] = {}
        loop = asyncio.get_event_loop()
        pool = self._ensure_process_pool()

        for visual_type in plan.visual_types:
            try:
                if visual_type == "bar_chart":
                    result = await loop.run_in_executor(
                        pool,
                        self.visuals.generate_bar_chart,
                        plan.topic,
                        query,
                    )
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "line_chart":
                    result = await loop.run_in_executor(
                        pool,
                        self.visuals.generate_line_chart,
                        plan.topic,
                        query,
                    )
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "long_division":
                    result = self.visuals.generate_long_division()
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "life_cycle":
                    result = self.visuals.generate_life_cycle(plan.topic)
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "node_graph":
                    result = self.visuals.generate_node_graph(plan.topic)
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "hex_steps":
                    result = self.visuals.generate_hex_steps([])
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "horizontal_blocks":
                    result = self.visuals.generate_horizontal_blocks(plan.topic)
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

                elif visual_type == "pyramid":
                    result = self.visuals.generate_pyramid(plan.topic)
                    if result.is_ok():
                        visuals_data[visual_type] = result.unwrap()

            except Exception:
                # Skip this visual if it fails, don't fail the whole request
                continue

        return Ok(visuals_data)

    def shutdown(self):
        """Shutdown process pool."""
        if self.process_pool:
            self.process_pool.shutdown(wait=True)
            self.process_pool = None

