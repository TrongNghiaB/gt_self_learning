"""Critic Agent - validates the final output."""
from app.core.result import Result, Ok, Err
from app.core.errors import ValidationError
from app.schemas.elements import Element


class CriticAgent:
    """
    Performs light validation on the final elements list.
    """

    def validate(self, elements: list[Element]) -> Result[list[Element], ValidationError]:
        """
        Validate that the elements list is acceptable.

        Args:
            elements: List of elements to validate

        Returns:
            Result containing validated elements or ValidationError
        """
        # Rule 1: Must have at least one element
        if not elements:
            return Err(
                ValidationError(
                    message="No elements generated",
                    details={"count": 0},
                )
            )

        # Rule 2: Must have at least one text block
        has_text_block = any(elem.type == "text_block" for elem in elements)
        if not has_text_block:
            return Err(
                ValidationError(
                    message="Must have at least one text_block element",
                    details={"element_count": len(elements)},
                )
            )

        # Rule 3: Elements should be properly ordered
        orders = [elem.order for elem in elements]
        if orders != sorted(orders):
            return Err(
                ValidationError(
                    message="Elements are not properly ordered",
                    details={"orders": orders},
                )
            )

        # Rule 4: No duplicate IDs
        ids = [elem.id for elem in elements]
        if len(ids) != len(set(ids)):
            return Err(
                ValidationError(
                    message="Duplicate element IDs found",
                    details={"ids": ids},
                )
            )

        # All validations passed
        return Ok(elements)

