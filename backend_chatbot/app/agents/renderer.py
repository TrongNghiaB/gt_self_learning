"""Renderer Agent - normalizes elements in final order with titles/captions."""
from typing import Optional
from app.core.result import Result, Ok, Err
from app.core.errors import RenderingError
from app.schemas.elements import (
    Element,
    TextBlock,
    Formula,
    ExampleSteps,
    BarChart,
    LineChart,
    LongDivision,
    LifeCycle,
    NodeGraph,
    HexSteps,
    HorizontalBlocks,
    Pyramid,
)
from app.agents.planner import Plan
from app.agents.math_solver import MathSolution
from app.agents.visuals import (
    BarChartData,
    LineChartData,
    LongDivisionData,
    LifeCycleData,
    NodeGraphData,
    HexStepsData,
    HorizontalBlocksData,
    PyramidData,
)


class RendererAgent:
    """
    Takes outputs from other agents and converts them into ordered Element objects.
    """

    def render_elements(
        self,
        plan: Plan,
        math_solution: MathSolution,
        visuals: dict[str, any],
    ) -> Result[list[Element], RenderingError]:
        """
        Render all elements in proper order.

        Args:
            plan: Plan from PlannerAgent
            math_solution: Solution from MathSolverAgent
            visuals: Dictionary of visual data from VisualsAgent

        Returns:
            Result containing ordered list of Elements or RenderingError
        """
        try:
            elements: list[Element] = []
            order = 0

            # 1. Introduction text block (always first)
            if plan.needs_intro:
                elements.append(
                    TextBlock(
                        id=f"elem_{order}",
                        type="text_block",
                        order=order,
                        title="Introduction",
                        text=math_solution.explanation,
                    )
                )
                order += 1

            # 2. Formula (if needed)
            if plan.needs_formula and (
                math_solution.formula_latex or math_solution.formula_text
            ):
                elements.append(
                    Formula(
                        id=f"elem_{order}",
                        type="formula",
                        order=order,
                        title="Key Formula",
                        latex=math_solution.formula_latex,
                        text=math_solution.formula_text,
                    )
                )
                order += 1

            # 3. Example steps (if needed)
            if plan.needs_example and math_solution.example_steps:
                elements.append(
                    ExampleSteps(
                        id=f"elem_{order}",
                        type="example_steps",
                        order=order,
                        title="Worked Example",
                        steps=math_solution.example_steps,
                    )
                )
                order += 1

            # 4. Add visuals in order
            for visual_type in plan.visual_types:
                visual_data = visuals.get(visual_type)
                if not visual_data:
                    continue

                element = self._create_visual_element(
                    visual_type, visual_data, order, plan.topic
                )
                if element:
                    elements.append(element)
                    order += 1

            return Ok(elements)

        except Exception as e:
            return Err(
                RenderingError(
                    message=f"Failed to render elements: {str(e)}",
                    details={"topic": plan.topic},
                )
            )

    def _create_visual_element(
        self, visual_type: str, visual_data: any, order: int, topic: str
    ) -> Optional[Element]:
        """Create appropriate Element for the visual type."""
        elem_id = f"elem_{order}"

        if visual_type == "bar_chart" and isinstance(visual_data, BarChartData):
            return BarChart(
                id=elem_id,
                type="bar_chart",
                order=order,
                title="Comparison Chart",
                data=visual_data.data,
                labels=visual_data.labels,
                image_base64=visual_data.image_base64,
            )

        elif visual_type == "line_chart" and isinstance(visual_data, LineChartData):
            return LineChart(
                id=elem_id,
                type="line_chart",
                order=order,
                title="Function Graph",
                x=visual_data.x,
                y=visual_data.y,
                image_base64=visual_data.image_base64,
            )

        elif visual_type == "long_division" and isinstance(
            visual_data, LongDivisionData
        ):
            return LongDivision(
                id=elem_id,
                type="long_division",
                order=order,
                title="Long Division Steps",
                dividend=visual_data.dividend,
                divisor=visual_data.divisor,
                steps=visual_data.steps,
            )

        elif visual_type == "life_cycle" and isinstance(visual_data, LifeCycleData):
            return LifeCycle(
                id=elem_id,
                type="life_cycle",
                order=order,
                title="Problem-Solving Lifecycle",
                stages=visual_data.stages,
            )

        elif visual_type == "node_graph" and isinstance(visual_data, NodeGraphData):
            return NodeGraph(
                id=elem_id,
                type="node_graph",
                order=order,
                title="Concept Relationships",
                nodes=visual_data.nodes,
                edges=visual_data.edges,
            )

        elif visual_type == "hex_steps" and isinstance(visual_data, HexStepsData):
            return HexSteps(
                id=elem_id,
                type="hex_steps",
                order=order,
                title="Solution Steps",
                items=visual_data.items,
            )

        elif visual_type == "horizontal_blocks" and isinstance(
            visual_data, HorizontalBlocksData
        ):
            return HorizontalBlocks(
                id=elem_id,
                type="horizontal_blocks",
                order=order,
                title="Learning Progression",
                items=visual_data.items,
            )

        elif visual_type == "pyramid" and isinstance(visual_data, PyramidData):
            return Pyramid(
                id=elem_id,
                type="pyramid",
                order=order,
                title="Knowledge Hierarchy",
                levels=visual_data.levels,
            )

        return None

