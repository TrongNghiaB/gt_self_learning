"""Concurrency helpers and executor management."""
import os
from concurrent.futures import ThreadPoolExecutor, ProcessPoolExecutor
from typing import Literal
from dataclasses import dataclass


TaskKind = Literal["io", "cpu"]
Strategy = Literal["asyncio", "thread", "process"]


@dataclass(frozen=True)
class ExecutorStrategy:
    """Executor strategy for a given task."""

    strategy: Strategy


def choose_executor(task_kind: TaskKind) -> ExecutorStrategy:
    """
    Choose the appropriate executor strategy based on task kind.

    Args:
        task_kind: "io" for I/O-bound tasks, "cpu" for CPU-bound tasks

    Returns:
        ExecutorStrategy indicating which executor to use
    """
    if task_kind == "io":
        return ExecutorStrategy(strategy="thread")
    elif task_kind == "cpu":
        return ExecutorStrategy(strategy="process")
    else:
        raise ValueError(f"Unknown task kind: {task_kind}")


def create_thread_pool() -> ThreadPoolExecutor:
    """Create a thread pool executor for I/O-bound tasks."""
    max_workers = min(32, (os.cpu_count() or 1) + 4)
    return ThreadPoolExecutor(max_workers=max_workers)


def create_process_pool() -> ProcessPoolExecutor:
    """Create a process pool executor for CPU-bound tasks."""
    max_workers = os.cpu_count() or 1
    return ProcessPoolExecutor(max_workers=max_workers)

