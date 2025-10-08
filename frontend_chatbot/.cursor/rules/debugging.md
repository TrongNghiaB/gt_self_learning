# Debugging Rules — social_network_app

## 1. Environment Setup

- Enable **Flutter DevTools** (performance, memory, network).
- Use `Logger` singleton with tagged logs: `logger.t('feed').d('message')`.
- Enable Dio `LogInterceptor` in debug mode only.

## 2. Bug Report Template

- **Steps:** Repro instructions.
- **Expected vs Actual** result.
- **Environment:** device, OS, flavor, build number.
- **Logs:** Attach `logcat` / Dio dumps.
- **State:** Include provider states if relevant.

## 3. Logging Standards

- Levels: `v < d < i < w < e`.
- Always include **context** (feature, route, userId, requestId).
- Mask sensitive data (tokens, emails).

## 4. Network Debugging

- Log request method, URL, headers (masked), body (≤2KB), time.
- Log response status, body (≤4KB), duration.
- Provide helper to export cURL from Dio request for reproduction.

## 5. Riverpod Debugging

- Use custom `ProviderObserver` to log provider state updates.
- Implement `dumpState()` methods in key controllers for quick snapshot logs.

## 6. Performance

- Use `Stopwatch` for profiling critical flows (>50ms = log warning).
- Prevent unnecessary rebuilds (split widgets, use `select()` in Riverpod).

## 7. Firebase Debugging

- **Auth:** log sign-in/out events and providers.
- **Firestore:** log collection/doc paths, query duration.
- **Messaging:** verify token, topic, and background handler before `runApp()`.

## 8. Crash & ANR

- Handle `FlutterError.onError`; forward to logger or Crashlytics.
- Avoid broad `try/catch` without rethrow or mapping to `Failure`.

## 9. Tools

- Use DevTools (timeline, memory) for profiling.
- Use `dart:developer` → `log()` for custom performance markers.
