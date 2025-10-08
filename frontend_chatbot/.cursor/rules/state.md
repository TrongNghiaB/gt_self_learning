## Providers

- Global: dioProvider, loggerProvider, firebaseAuthProvider.
- Feature: StateNotifier / AsyncNotifier cho controller.

## AsyncValue

- Mọi async logic trả về AsyncValue<T>.
- ref.listen để catch error hiển thị Snackbar.

## Example

```dart
class FeedController extends AutoDisposeAsyncNotifier<FeedState> {
late final FeedRepository _repo = ref.read(feedRepositoryProvider);
@override Future<FeedState> build() async => _repo.initial();
Future<void> refresh() => update((_) async => _repo.refresh());
}
```
