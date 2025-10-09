"""Element type schemas for the explanation response."""
from typing import Literal, Union, Optional
from pydantic import BaseModel, Field


class TextBlock(BaseModel):
    """Text content block."""

    id: str
    type: Literal["text_block"] = "text_block"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    text: str


class Formula(BaseModel):
    """Mathematical formula."""

    id: str
    type: Literal["formula"] = "formula"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    latex: Optional[str] = None
    text: Optional[str] = None


class StepDetail(BaseModel):
    """Single step in solution."""
    
    step_num: int
    step_text: str


class ExampleSteps(BaseModel):
    """Step-by-step example solution."""

    id: str
    type: Literal["example_steps"] = "example_steps"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    steps: list[StepDetail]


class AnswerBlock(BaseModel):
    """Final answer block."""

    id: str
    type: Literal["answer_block"] = "answer_block"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    answer: str
    explanation: Optional[str] = None


class BarChart(BaseModel):
    """Bar chart visualization (base64 PNG)."""

    id: str
    type: Literal["bar_chart"] = "bar_chart"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    data: list[float]
    labels: list[str]
    image_base64: str


class LineChart(BaseModel):
    """Line chart visualization (base64 PNG)."""

    id: str
    type: Literal["line_chart"] = "line_chart"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    x: list[float]
    y: list[float]
    image_base64: str


class LongDivisionStep(BaseModel):
    """A single step in long division."""

    quotient_digit: int
    partial_product: int
    remainder: int


class LongDivision(BaseModel):
    """Long division visualization."""

    id: str
    type: Literal["long_division"] = "long_division"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    dividend: int
    divisor: int
    steps: list[LongDivisionStep]


class LifeCycle(BaseModel):
    """Lifecycle diagram."""

    id: str
    type: Literal["life_cycle"] = "life_cycle"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    stages: list[str]


class GraphNode(BaseModel):
    """Node in a graph."""

    id: str
    label: str


class GraphEdge(BaseModel):
    """Edge in a graph."""

    source: str
    target: str
    label: Optional[str] = None


class NodeGraph(BaseModel):
    """Node graph visualization."""

    id: str
    type: Literal["node_graph"] = "node_graph"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    nodes: list[GraphNode]
    edges: list[GraphEdge]


class HexSteps(BaseModel):
    """Hexagonal steps layout."""

    id: str
    type: Literal["hex_steps"] = "hex_steps"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    items: list[str]


class HorizontalBlock(BaseModel):
    """A single horizontal block."""

    title: str
    desc: str


class HorizontalBlocks(BaseModel):
    """Horizontal blocks layout."""

    id: str
    type: Literal["horizontal_blocks"] = "horizontal_blocks"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    items: list[HorizontalBlock]


class Pyramid(BaseModel):
    """Pyramid structure."""

    id: str
    type: Literal["pyramid"] = "pyramid"
    order: int
    title: Optional[str] = None
    caption: Optional[str] = None
    levels: list[list[str]]


# Union type for all possible elements
Element = Union[
    TextBlock,
    Formula,
    ExampleSteps,
    AnswerBlock,
    BarChart,
    LineChart,
    LongDivision,
    LifeCycle,
    NodeGraph,
    HexSteps,
    HorizontalBlocks,
    Pyramid,
]

