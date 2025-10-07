"""Tests for Result type and error handling."""
import pytest
from app.core.result import Ok, Err
from app.core.errors import PlanningError, InvariantError


def test_ok_is_ok():
    """Test Ok result is_ok returns True."""
    result = Ok(42)
    assert result.is_ok()
    assert not result.is_err()


def test_err_is_err():
    """Test Err result is_err returns True."""
    result = Err(PlanningError(message="Test error"))
    assert result.is_err()
    assert not result.is_ok()


def test_ok_unwrap():
    """Test Ok unwrap returns value."""
    result = Ok(42)
    assert result.unwrap() == 42


def test_err_unwrap_raises():
    """Test Err unwrap raises ValueError."""
    result = Err(PlanningError(message="Test error"))
    with pytest.raises(ValueError):
        result.unwrap()


def test_ok_unwrap_or():
    """Test Ok unwrap_or returns value."""
    result = Ok(42)
    assert result.unwrap_or(0) == 42


def test_err_unwrap_or():
    """Test Err unwrap_or returns default."""
    result = Err(PlanningError(message="Test error"))
    assert result.unwrap_or(0) == 0


def test_ok_map():
    """Test Ok map applies function."""
    result = Ok(42)
    mapped = result.map(lambda x: x * 2)
    assert mapped.is_ok()
    assert mapped.unwrap() == 84


def test_err_map():
    """Test Err map does not apply function."""
    result = Err(PlanningError(message="Test error"))
    mapped = result.map(lambda x: x * 2)
    assert mapped.is_err()


def test_invariant_error():
    """Test InvariantError can be raised."""
    with pytest.raises(InvariantError):
        raise InvariantError("This should not happen")

