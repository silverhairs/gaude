import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_user.freezed.dart';
part 'account_user.g.dart';

@freezed
class AccountUser with _$AccountUser {
  const factory AccountUser({
    required String id,
    required String email,
    required String name,
    required String photoUrl,
  }) = _Account;

  factory AccountUser.fromJson(Map<String, dynamic> json) =>
      _$AccountUserFromJson(json);
}
