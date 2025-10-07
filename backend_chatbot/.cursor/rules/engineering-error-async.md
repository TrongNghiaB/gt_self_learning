# Engineering Rules — Python Error Philosophy & Concurrency Strategy

## Error Philosophy (Python)

- Prefer explicit return types for _expected, recoverable_ conditions (Result/Either pattern).
- Only `raise` exceptions for:
  1. Programmer errors / invariant violations (e.g., impossible states),
  2. Security access violations,
  3. Non-recoverable system faults (e.g., corrupted state),
  4. Cancellations/Timeouts (propagate),
  5. Input validation at boundaries (but convert to 4xx HTTP with clear messages).
- Do NOT use exceptions for control flow or normal branching.
- Attach context: use `raise ... from e` để giữ traceback.
- Log at the boundary once; don’t spam logs ở tầng sâu.

### When returning vs raising

- Return `Result[Value, DomainError]` cho nghiệp vụ có thể xử lý tiếp (ví dụ: không tìm thấy dữ liệu, yêu cầu chưa đủ thông tin).
- Raise `ValueError/TypeError` sớm ở input boundary nếu vi phạm precondition.
- Raise custom `InvariantError` khi state nội bộ không đúng và không thể tiếp tục an toàn.
- HTTP layer: map DomainError → 4xx (422/400/404) kèm message có thể đọc được.

## Concurrency Strategy (Python)

- Decide by workload:
  - **I/O-bound** (file, mạng, DB, HTTP): prefer `asyncio` + native async libs. Nếu lib blocking → `ThreadPoolExecutor`.
  - **CPU-bound** (SymPy, NumPy nặng, matplotlib render): prefer `ProcessPoolExecutor`.
  - **Mixed**: tách pha I/O (async) và pha tính toán (ProcessPool).
- GIL reminder:
  - Threads không tăng tốc CPU-bound → dùng ProcessPool.
  - Threads tốt cho blocking I/O hoặc lib không async.
- Don’t mix without reason: ưu tiên một event loop (asyncio) ở layer trên; offload tác vụ blocking sang executor.

### Practical defaults for this project

- SymPy derivations/simplify → `ProcessPoolExecutor`.
- Matplotlib figure rendering → `ProcessPoolExecutor`.
- HTTP FastAPI handlers: `async def` + `await` for I/O, `.run_in_executor()` để offload compute.
- Size executors: `max_workers = min(32, os.cpu_count() + 4)` cho ThreadPool; `os.cpu_count()` cho ProcessPool.

## Implementation Requirements

- Provide a `Result[T, E]` type (success/error), domain error classes, and `map_to_http()` for FastAPI.
- Provide `choose_executor(task_kind)` helper returning {strategy: "asyncio" | "thread" | "process"}.
- Agents must NOT raise for normal domain misses; return `Result`.
- Orchestrator consolidates results; only raises on invariants or timeouts/cancellation.

## Testing

- Unit tests must cover:
  - Returning Result for recoverable paths.
  - InvariantError paths `with pytest.raises`.
  - Concurrency selector decisions for CPU vs I/O.
