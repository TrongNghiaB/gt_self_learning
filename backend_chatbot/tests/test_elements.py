"""Tests for element schemas."""
import pytest
from pydantic import ValidationError
from app.schemas.elements import (
    TextBlock,
    Formula,
    ExampleSteps,
    BarChart,
    LineChart,
    LongDivision,
    LongDivisionStep,
    LifeCycle,
    NodeGraph,
    GraphNode,
    GraphEdge,
    HexSteps,
    HorizontalBlocks,
    HorizontalBlock,
    Pyramid,
)


def test_text_block_schema():
    """Test TextBlock schema validation."""
    tb = TextBlock(
        id="elem_0",
        type="text_block",
        order=0,
        title="Test",
        text="This is a test",
    )
    assert tb.id == "elem_0"
    assert tb.type == "text_block"
    assert tb.order == 0
    assert tb.title == "Test"
    assert tb.text == "This is a test"


def test_formula_schema():
    """Test Formula schema validation."""
    formula = Formula(
        id="elem_1",
        type="formula",
        order=1,
        latex="x^2 + y^2 = z^2",
        text="Pythagorean theorem",
    )
    assert formula.latex == "x^2 + y^2 = z^2"
    assert formula.text == "Pythagorean theorem"


def test_example_steps_schema():
    """Test ExampleSteps schema validation."""
    steps = ExampleSteps(
        id="elem_2",
        type="example_steps",
        order=2,
        steps=["Step 1", "Step 2", "Step 3"],
    )
    assert len(steps.steps) == 3
    assert steps.steps[0] == "Step 1"


def test_bar_chart_schema():
    """Test BarChart schema validation."""
    chart = BarChart(
        id="elem_3",
        type="bar_chart",
        order=3,
        data=[10.5, 20.3, 15.7],
        labels=["A", "B", "C"],
        image_base64="base64data",
    )
    assert len(chart.data) == 3
    assert len(chart.labels) == 3
    assert chart.image_base64 == "base64data"


def test_line_chart_schema():
    """Test LineChart schema validation."""
    chart = LineChart(
        id="elem_4",
        type="line_chart",
        order=4,
        x=[1.0, 2.0, 3.0],
        y=[1.0, 4.0, 9.0],
        image_base64="base64data",
    )
    assert len(chart.x) == 3
    assert len(chart.y) == 3


def test_long_division_schema():
    """Test LongDivision schema validation."""
    div = LongDivision(
        id="elem_5",
        type="long_division",
        order=5,
        dividend=156,
        divisor=12,
        steps=[
            LongDivisionStep(quotient_digit=1, partial_product=12, remainder=3),
            LongDivisionStep(quotient_digit=3, partial_product=36, remainder=0),
        ],
    )
    assert div.dividend == 156
    assert div.divisor == 12
    assert len(div.steps) == 2


def test_life_cycle_schema():
    """Test LifeCycle schema validation."""
    lc = LifeCycle(
        id="elem_6",
        type="life_cycle",
        order=6,
        stages=["Stage 1", "Stage 2", "Stage 3"],
    )
    assert len(lc.stages) == 3


def test_node_graph_schema():
    """Test NodeGraph schema validation."""
    graph = NodeGraph(
        id="elem_7",
        type="node_graph",
        order=7,
        nodes=[
            GraphNode(id="n1", label="Node 1"),
            GraphNode(id="n2", label="Node 2"),
        ],
        edges=[
            GraphEdge(source="n1", target="n2", label="connects"),
        ],
    )
    assert len(graph.nodes) == 2
    assert len(graph.edges) == 1
    assert graph.edges[0].source == "n1"


def test_hex_steps_schema():
    """Test HexSteps schema validation."""
    hex_steps = HexSteps(
        id="elem_8",
        type="hex_steps",
        order=8,
        items=["Step 1", "Step 2", "Step 3"],
    )
    assert len(hex_steps.items) == 3


def test_horizontal_blocks_schema():
    """Test HorizontalBlocks schema validation."""
    blocks = HorizontalBlocks(
        id="elem_9",
        type="horizontal_blocks",
        order=9,
        items=[
            HorizontalBlock(title="Block 1", desc="Description 1"),
            HorizontalBlock(title="Block 2", desc="Description 2"),
        ],
    )
    assert len(blocks.items) == 2
    assert blocks.items[0].title == "Block 1"


def test_pyramid_schema():
    """Test Pyramid schema validation."""
    pyramid = Pyramid(
        id="elem_10",
        type="pyramid",
        order=10,
        levels=[
            ["Top"],
            ["Middle 1", "Middle 2"],
            ["Bottom 1", "Bottom 2", "Bottom 3"],
        ],
    )
    assert len(pyramid.levels) == 3
    assert len(pyramid.levels[0]) == 1
    assert len(pyramid.levels[2]) == 3


def test_invalid_element_type():
    """Test that invalid type raises ValidationError."""
    with pytest.raises(ValidationError):
        TextBlock(
            id="elem_0",
            type="invalid_type",  # type: ignore
            order=0,
            text="Test",
        )

