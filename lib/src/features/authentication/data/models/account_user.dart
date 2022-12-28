import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_user.freezed.dart';
part 'account_user.g.dart';

@freezed
class AccountUser with _$AccountUser {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AccountUser({
    required String id,
    required String email,
    required String name,
    required String photoUrl,
  }) = _Account;

  factory AccountUser.fromJson(Map<String, dynamic> json) =>
      _$AccountUserFromJson(json);
}
