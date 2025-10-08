# Freezed & JSON Rules

## Example

```dart
@freezed
class Post with _$Post {
const factory Post({
required String id,
required String authorId,
required String content,
DateTime? createdAt,
@Default(0) int likeCount,
}) = _Post;


factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
```

# Tips

DTO riêng, Entity riêng.

explicitToJson: true.

@JsonKey(name: 'server_field') cho mismatched fields.
