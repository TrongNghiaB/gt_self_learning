# Clean Code Rules — social_network_app

## 0. Core Principles

- **Single Responsibility:** Each class/file should serve one clear purpose.
- **Pure-first:** Prefer pure functions with no side effects. Keep side effects (I/O, state changes) isolated in repositories or controllers.
- **Immutability:** Models and states must be immutable (use `Freezed` or `const`). Never mutate lists/maps directly.
- **Explicit > Implicit:** Use explicit data types; avoid `dynamic`.
- **Fail Fast:** Validate early. Handle and map errors as soon as possible in the data layer.

## 1. Layering Rules

- Dependency direction: `presentation → domain → data` (never reverse).
- **Presentation** knows only domain interfaces (no Dio/Firebase import).
- **Domain** contains pure logic and entities (no Flutter/Dio imports).

## 2. Naming & Structure

- Files: `snake_case`, Classes: `UpperCamelCase`, variables/functions: `lowerCamelCase`.
- Use suffixes: `*_page.dart`, `*_controller.dart`, `*_repository.dart`, `*_dto.dart`, `*_entity.dart`.
- Barrel files (`index.dart`) only within a single feature when beneficial.

## 3. Functions & Classes

- Function ≤ 40 LOC, Class ≤ 200 LOC.
- Avoid boolean flag parameters like `doSomething(isFast: true)` → split into explicit functions.
- Prefer **composition** over inheritance.

## 4. Widgets

- Use **Stateless + hooks** first; handle async state via Riverpod.
- No I/O or heavy initialization inside `build()`.
- Break UI into reusable widgets (layout, card, list item, dialog, etc.).
- Always use `const` where possible and stable `Key`s for lists.

## 5. Riverpod

- Expose async state as `AsyncValue<T>`.
- Use `ref.listen` for side effects (SnackBar/Dialog) instead of inside `build()`.
- Provider naming convention: `authRepositoryProvider`, `feedControllerProvider`.
- Use `AutoDispose` for short-lived providers; `keepAlive` only when justified.

## 6. Error Handling

- Data layer: map raw errors → `Failure` (Network/Client/Server/Unknown).
- Domain/Presentation: use `Either<Failure, T>`.
- Never swallow exceptions; log with context (feature, userId, route).

## 7. JSON/DTO

- DTOs (from HTTP/Firebase) ≠ Entities (domain). Map them clearly.
- Always use `withConverter` for Firestore, avoid raw `Map<String, dynamic>`.

## 8. Formatting & Linting

- Enforce `flutter_lints`. Never disable rules silently.
- Run `dart format` pre-commit.

## 9. Comments & Docs

- Public APIs require `///` doc comments explaining _why_, not _what_.
- Use TODO tags with owner/date: `// TODO(@name, yyyy-mm-dd): description`.

## 10. Commits & Pull Requests

- Follow **Conventional Commits**: `feat:`, `fix:`, `refactor:`, `test:`, `chore:`.
- Keep PRs small with checklist: tests, docs, screenshots, migration notes.
