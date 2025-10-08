# Advanced Refactor Rules — social_network_app

## 1. Safe Process

1. **Type-first:** Introduce new APIs/types alongside the old ones.
2. **Adapter:** Use adapters to bridge old/new APIs where needed.
3. **Migrate** gradually by feature with dedicated tests.
4. Mark deprecated APIs using `@Deprecated('use X')` and include migration notes.

## 2. Codemods & Patterns

- `setState` → Riverpod: move logic to controller, UI only listens.
- `Navigator` → AutoRoute: replace with `context.router.push(const XRoute())`.
- POJO → Freezed: use `@freezed` and generated JSON.

## 3. Repository & DTO Evolution

- When changing API schema: introduce `v2` DTO or endpoint, don’t break UI backward compatibility.
- Domain mappers convert between old and new formats.

## 4. Feature Flags

- Add global `FeatureFlags` config (remote or env) for staged rollouts.
- Flag all large-scale refactors that may affect user flow.

## 5. Firestore Migration

- Write migration scripts externally (batch updates).
- Client should read both old and new fields temporarily.
- Use `@JsonKey(defaultValue: ...)` to prevent null issues.

## 6. Performance & Regression

- Compare metrics: cold start, first frame, list scroll FPS.
- Keep PR diffs < 500 LOC for easy review.

## 7. Testing Strategy

- Snapshot tests for JSON schema migration.
- Controller tests for state transitions pre/post refactor.
- Route smoke tests to ensure navigation remains functional.

## 8. Deprecation Policy

- Tag old APIs with `@Deprecated`, include issue link and removal timeline.
- Remove deprecated code after two minor versions.
