"""Tests for concurrency helpers."""
import pytest
from app.core.concurrency import choose_executor, ExecutorStrategy


def test_choose_executor_io():
    """Test executor selection for I/O-bound tasks."""
    strategy = choose_executor("io")
    assert isinstance(strategy, ExecutorStrategy)
    assert strategy.strategy == "thread"


def test_choose_executor_cpu():
    """Test executor selection for CPU-bound tasks."""
    strategy = choose_executor("cpu")
    assert isinstance(strategy, ExecutorStrategy)
    assert strategy.strategy == "process"


def test_choose_executor_invalid():
    """Test executor selection with invalid task kind."""
    with pytest.raises(ValueError):
        choose_executor("invalid")  # type: ignore

