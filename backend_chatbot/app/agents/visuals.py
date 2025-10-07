"""Visuals Agent - prepares data and renders charts/diagrams."""
from dataclasses import dataclass
import io
import base64
import matplotlib
matplotlib.use("Agg")  # Non-interactive backend
import matplotlib.pyplot as plt
import numpy as np
from app.core.result import Result, Ok, Err
from app.core.errors import VisualsError
from app.schemas.elements import (
    LongDivisionStep,
    GraphNode,
    GraphEdge,
    HorizontalBlock,
)


@dataclass(frozen=True)
class BarChartData:
    """Data for bar chart."""

    data: list[float]
    labels: list[str]
    image_base64: str


@dataclass(frozen=True)
class LineChartData:
    """Data for line chart."""

    x: list[float]
    y: list[float]
    image_base64: str


@dataclass(frozen=True)
class LongDivisionData:
    """Data for long division."""

    dividend: int
    divisor: int
    steps: list[LongDivisionStep]


@dataclass(frozen=True)
class LifeCycleData:
    """Data for lifecycle diagram."""

    stages: list[str]


@dataclass(frozen=True)
class NodeGraphData:
    """Data for node graph."""

    nodes: list[GraphNode]
    edges: list[GraphEdge]


@dataclass(frozen=True)
class HexStepsData:
    """Data for hex steps."""

    items: list[str]


@dataclass(frozen=True)
class HorizontalBlocksData:
    """Data for horizontal blocks."""

    items: list[HorizontalBlock]


@dataclass(frozen=True)
class PyramidData:
    """Data for pyramid."""

    levels: list[list[str]]


class VisualsAgent:
    """
    Generates visualization data and renders charts to base64 PNG.
    CPU-bound rendering should be offloaded to ProcessPoolExecutor.
    """

    def generate_bar_chart(
        self, topic: str, query: str
    ) -> Result[BarChartData, VisualsError]:
        """Generate bar chart data and image."""
        try:
            # Sample data based on topic
            if "compare" in query.lower():
                labels = ["Method A", "Method B", "Method C", "Method D"]
                data = [85.5, 92.3, 78.9, 88.1]
            else:
                labels = ["Q1", "Q2", "Q3", "Q4"]
                data = [23.5, 45.2, 38.7, 51.3]

            # Render chart
            image_base64 = self._render_bar_chart(data, labels, topic)

            return Ok(BarChartData(data=data, labels=labels, image_base64=image_base64))
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate bar chart: {str(e)}",
                    details={"topic": topic},
                )
            )

    def generate_line_chart(
        self, topic: str, query: str
    ) -> Result[LineChartData, VisualsError]:
        """Generate line chart data and image."""
        try:
            # Sample data
            if "function" in query.lower() or "quadratic" in query.lower():
                x = np.linspace(-5, 5, 100).tolist()
                y = [xi**2 - 2 * xi - 3 for xi in x]
            else:
                x = list(range(0, 11))
                y = [xi**1.5 + 2 for xi in x]

            # Render chart
            image_base64 = self._render_line_chart(x, y, topic)

            return Ok(LineChartData(x=x, y=y, image_base64=image_base64))
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate line chart: {str(e)}",
                    details={"topic": topic},
                )
            )

    def generate_long_division(
        self, dividend: int = 156, divisor: int = 12
    ) -> Result[LongDivisionData, VisualsError]:
        """Generate long division steps."""
        try:
            steps = []
            quotient = dividend // divisor
            remainder = dividend % divisor

            # Generate step-by-step division
            current = dividend
            for digit in str(quotient):
                d = int(digit)
                partial = d * divisor
                current = current - partial
                steps.append(
                    LongDivisionStep(
                        quotient_digit=d, partial_product=partial, remainder=current
                    )
                )

            return Ok(
                LongDivisionData(dividend=dividend, divisor=divisor, steps=steps)
            )
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate long division: {str(e)}",
                    details={"dividend": dividend, "divisor": divisor},
                )
            )

    def generate_life_cycle(self, topic: str) -> Result[LifeCycleData, VisualsError]:
        """Generate lifecycle stages."""
        try:
            # Generic lifecycle stages
            stages = [
                "Problem Identification",
                "Analysis & Planning",
                "Solution Development",
                "Implementation",
                "Verification",
                "Iteration",
            ]

            return Ok(LifeCycleData(stages=stages))
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate lifecycle: {str(e)}",
                    details={"topic": topic},
                )
            )

    def generate_node_graph(self, topic: str) -> Result[NodeGraphData, VisualsError]:
        """Generate node graph."""
        try:
            # Sample graph structure
            nodes = [
                GraphNode(id="n1", label="Concept A"),
                GraphNode(id="n2", label="Concept B"),
                GraphNode(id="n3", label="Concept C"),
                GraphNode(id="n4", label="Result"),
            ]

            edges = [
                GraphEdge(source="n1", target="n4", label="influences"),
                GraphEdge(source="n2", target="n4", label="contributes"),
                GraphEdge(source="n3", target="n4", label="determines"),
                GraphEdge(source="n1", target="n2", label="relates to"),
            ]

            return Ok(NodeGraphData(nodes=nodes, edges=edges))
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate node graph: {str(e)}",
                    details={"topic": topic},
                )
            )

    def generate_hex_steps(self, steps: list[str]) -> Result[HexStepsData, VisualsError]:
        """Generate hexagonal steps layout."""
        try:
            if not steps:
                steps = ["Step 1", "Step 2", "Step 3", "Step 4"]

            return Ok(HexStepsData(items=steps[:6]))  # Max 6 items
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate hex steps: {str(e)}",
                )
            )

    def generate_horizontal_blocks(
        self, topic: str
    ) -> Result[HorizontalBlocksData, VisualsError]:
        """Generate horizontal blocks."""
        try:
            blocks = [
                HorizontalBlock(
                    title="Foundation", desc="Build fundamental understanding"
                ),
                HorizontalBlock(
                    title="Application", desc="Apply concepts to problems"
                ),
                HorizontalBlock(title="Mastery", desc="Achieve deep comprehension"),
            ]

            return Ok(HorizontalBlocksData(items=blocks))
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate horizontal blocks: {str(e)}",
                    details={"topic": topic},
                )
            )

    def generate_pyramid(self, topic: str) -> Result[PyramidData, VisualsError]:
        """Generate pyramid structure."""
        try:
            levels = [
                ["Mastery"],
                ["Advanced Concepts", "Complex Applications"],
                ["Intermediate Topics", "Practice", "Problem Solving"],
                ["Basic Principles", "Fundamental Rules", "Simple Examples", "Definitions"],
            ]

            return Ok(PyramidData(levels=levels))
        except Exception as e:
            return Err(
                VisualsError(
                    message=f"Failed to generate pyramid: {str(e)}",
                    details={"topic": topic},
                )
            )

    def _render_bar_chart(
        self, data: list[float], labels: list[str], title: str
    ) -> str:
        """Render bar chart to base64 PNG."""
        fig, ax = plt.subplots(figsize=(8, 5))
        ax.bar(labels, data, color="#4A90E2")
        ax.set_ylabel("Value")
        ax.set_title(title)
        ax.grid(axis="y", alpha=0.3)

        # Convert to base64
        buf = io.BytesIO()
        plt.savefig(buf, format="png", dpi=100, bbox_inches="tight")
        plt.close(fig)
        buf.seek(0)
        image_base64 = base64.b64encode(buf.read()).decode("utf-8")

        return image_base64

    def _render_line_chart(
        self, x: list[float], y: list[float], title: str
    ) -> str:
        """Render line chart to base64 PNG."""
        fig, ax = plt.subplots(figsize=(8, 5))
        ax.plot(x, y, color="#4A90E2", linewidth=2)
        ax.set_xlabel("x")
        ax.set_ylabel("f(x)")
        ax.set_title(title)
        ax.grid(True, alpha=0.3)

        # Convert to base64
        buf = io.BytesIO()
        plt.savefig(buf, format="png", dpi=100, bbox_inches="tight")
        plt.close(fig)
        buf.seek(0)
        image_base64 = base64.b64encode(buf.read()).decode("utf-8")

        return image_base64

