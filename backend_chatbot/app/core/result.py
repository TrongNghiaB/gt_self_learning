"""Result type for error handling without exceptions."""
from typing import TypeVar, Generic, Callable, Union
from dataclasses import dataclass


T = TypeVar("T")
E = TypeVar("E")
U = TypeVar("U")


@dataclass(frozen=True)
class Ok(Generic[T]):
    """Success result containing a value."""

    value: T

    def is_ok(self) -> bool:
        return True

    def is_err(self) -> bool:
        return False

    def unwrap(self) -> T:
        return self.value

    def unwrap_or(self) -> T:
        return self.value

    def map(self, func: Callable[[T], U]) -> "Result[U, E]":
        return Ok(func(self.value))

    def map_err(self) -> "Result[T, U]":
        return self  # type: ignore


@dataclass(frozen=True)
class Err(Generic[E]):
    """Error result containing an error value."""

    error: E

    def is_ok(self) -> bool:
        return False

    def is_err(self) -> bool:
        return True

    def unwrap(self) -> T:
        raise ValueError(f"Called unwrap on Err: {self.error}")

    def unwrap_or(self, default: T) -> T:
        return default

    def map(self) -> "Result[U, E]":
        return self  # type: ignore

    def map_err(self, func: Callable[[E], U]) -> "Result[T, U]":
        return Err(func(self.error))


Result = Union[Ok[T], Err[E]]

