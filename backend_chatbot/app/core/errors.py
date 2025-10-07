"""Domain error types and HTTP mapping."""
from dataclasses import dataclass
from typing import Any, Optional
from fastapi import HTTPException, status


@dataclass(frozen=True)
class DomainError:
    """Base class for all domain errors."""

    message: str
    details: Optional[dict[str, Any]] = None


@dataclass(frozen=True)
class PlanningError(DomainError):
    """Error during planning phase."""

    pass


@dataclass(frozen=True)
class MathSolvingError(DomainError):
    """Error during math solving phase."""

    pass


@dataclass(frozen=True)
class VisualsError(DomainError):
    """Error during visuals generation phase."""

    pass


@dataclass(frozen=True)
class RenderingError(DomainError):
    """Error during rendering phase."""

    pass


@dataclass(frozen=True)
class ValidationError(DomainError):
    """Error during validation phase."""

    pass


class InvariantError(Exception):
    """Raised when an internal invariant is violated (programmer error)."""

    pass


def map_to_http(error: DomainError) -> HTTPException:
    """Map domain errors to HTTP exceptions."""
    return HTTPException(
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
        detail={
            "error_type": error.__class__.__name__,
            "message": error.message,
            "details": error.details or {},
        },
    )

