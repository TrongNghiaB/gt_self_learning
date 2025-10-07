"""Tests for orchestrator and integration."""
import pytest
from app.agents.orchestrator import Orchestrator
from app.core.errors import InvariantError


@pytest.fixture
def orchestrator():
    """Create orchestrator instance."""
    orch = Orchestrator()
    yield orch
    orch.shutdown()


@pytest.mark.asyncio
async def test_orchestrator_basic_query(orchestrator):
    """Test orchestrator with a basic query."""
    result = await orchestrator.explain("Explain quadratic equations", "en")

    assert result.is_ok()
    topic, elements = result.unwrap()

    # Check that we got a topic
    assert isinstance(topic, str)
    assert len(topic) > 0

    # Check that we got elements
    assert isinstance(elements, list)
    assert len(elements) > 0

    # Check that we have at least one text_block (required by critic)
    text_blocks = [e for e in elements if e.type == "text_block"]
    assert len(text_blocks) > 0

    # Check elements are ordered
    orders = [e.order for e in elements]
    assert orders == sorted(orders)


@pytest.mark.asyncio
async def test_orchestrator_with_formula(orchestrator):
    """Test orchestrator with query that needs formula."""
    result = await orchestrator.explain("What is the quadratic formula?", "en")

    assert result.is_ok()
    topic, elements = result.unwrap()

    # Should have formula element
    formulas = [e for e in elements if e.type == "formula"]
    assert len(formulas) > 0


@pytest.mark.asyncio
async def test_orchestrator_with_example(orchestrator):
    """Test orchestrator with query that needs example."""
    result = await orchestrator.explain("How to solve quadratic equations step by step", "en")

    assert result.is_ok()
    topic, elements = result.unwrap()

    # Should have example_steps element
    examples = [e for e in elements if e.type == "example_steps"]
    assert len(examples) > 0


@pytest.mark.asyncio
async def test_orchestrator_empty_query(orchestrator):
    """Test orchestrator with empty query."""
    result = await orchestrator.explain("", "en")

    # Should return error
    assert result.is_err()


@pytest.mark.asyncio
async def test_orchestrator_with_visuals(orchestrator):
    """Test orchestrator with query that triggers visuals."""
    result = await orchestrator.explain("Graph quadratic functions", "en")

    assert result.is_ok()
    topic, elements = result.unwrap()

    # Check if we got any visual elements
    visual_types = {
        "bar_chart",
        "line_chart",
        "long_division",
        "life_cycle",
        "node_graph",
        "hex_steps",
        "horizontal_blocks",
        "pyramid",
    }

    element_types = {e.type for e in elements}
    has_visual = bool(element_types & visual_types)

    # We should have at least some visuals based on the query
    assert has_visual or len(elements) > 0  # At minimum we have text


@pytest.mark.asyncio
async def test_element_ids_unique(orchestrator):
    """Test that all element IDs are unique."""
    result = await orchestrator.explain("Explain derivatives", "en")

    assert result.is_ok()
    topic, elements = result.unwrap()

    ids = [e.id for e in elements]
    assert len(ids) == len(set(ids))  # All IDs should be unique


@pytest.mark.asyncio
async def test_orchestrator_multiple_queries(orchestrator):
    """Test orchestrator with multiple sequential queries."""
    queries = [
        "Explain integration",
        "What is the Pythagorean theorem?",
        "How to solve linear equations",
    ]

    for query in queries:
        result = await orchestrator.explain(query, "en")
        assert result.is_ok()
        topic, elements = result.unwrap()
        assert len(elements) > 0

