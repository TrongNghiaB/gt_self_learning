# Cursor Rules Index — social_network_app

**Purpose:** Bản đồ tóm tắt các file rule Cursor sẽ đọc để hiểu dự án.

### Files

- `flutter-project.md` → Kiến trúc tổng thể by-feature.
- `code-style.md` → Quy tắc đặt tên, format code, linter.
- `state.md` → State management với Riverpod.
- `routing.md` → AutoRoute config.
- `models.md` → Freezed + JSON rules.
- `networking.md` → Dio + dartz (Either<Failure, T>).
- `firebase.md` → Firebase (Auth, Firestore, Storage, Messaging).
- `notifications.md` → FCM + awesome_notifications.
- `tests.md` → Test logic và repo.
- `refactor.md` → Quy tắc refactor/migration.
- `generate.md` → Magic commands để Cursor tạo nhanh.

### Golden Rules

1. By-feature structure.
2. Stateless-first UI, state bằng Riverpod hooks.
3. Freezed + json_serializable cho tất cả models.
4. Dùng Dio + Either cho HTTP.
5. Navigation qua AutoRoute duy nhất.
6. AsyncValue cho mọi state IO.
7. Test mỗi model, repo, controller.
8. Không ignore lint nếu không có lý do.
9. Firebase auth/login chuẩn Google Sign-In.
10. Không in log bằng print trong production.
