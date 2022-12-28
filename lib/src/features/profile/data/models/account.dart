// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/authentication/data/models/account_user.dart';
import 'package:gaude/src/features/profile/data/models/account_settings.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  @JsonSerializable(explicitToJson: true)
  const factory Account({
    @_AccountUserJsonConverter() required AccountUser user,
    @_AccountSettingsJsonConverter() AccountSettings? settings,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

class _AccountUserJsonConverter
    implements JsonConverter<AccountUser, Map<String, dynamic>> {
  const _AccountUserJsonConverter();

  @override
  AccountUser fromJson(Map<String, dynamic> json) {
    return AccountUser.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AccountUser object) {
    return object.toJson();
  }
}

class _AccountSettingsJsonConverter
    implements JsonConverter<AccountSettings, Map<String, dynamic>> {
  const _AccountSettingsJsonConverter();

  @override
  AccountSettings fromJson(Map<String, dynamic> json) {
    return AccountSettings.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AccountSettings object) {
    return object.toJson();
  }
}
