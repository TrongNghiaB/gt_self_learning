## Bootstrap

1. Init Firebase.
2. Run ProviderScope.
3. Setup Dio + AppRouter + Logger.
4. Define global providers.
5. Splash → AuthGate → HomeRoute.

## Packages

- State: hooks_riverpod, flutter_hooks
- Routing: auto_route
- Models: freezed, json_serializable
- HTTP: dio, dartz
- Firebase: firebase_core/auth/firestore/storage/messaging
- UI: cached_network_image, shimmer, pull_to_refresh, intl, flutter_svg
- Infra: uuid, path_provider, logger
- Notifications: awesome_notifications

## Build commands

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
flutter pub run build_runner build --delete-conflicting-outputs
```
