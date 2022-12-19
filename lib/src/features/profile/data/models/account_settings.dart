import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/shared/shared.dart';

part 'account_settings.freezed.dart';
part 'account_settings.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class AccountSettings with _$AccountSettings {
  const factory AccountSettings({
    required Currency currency,
    @Default(AppSecurityType.none) AppSecurityType security,
    @Default(AppBrightness.system) AppBrightness brightness,
    @Default(<NotificationTypes>[]) Set<NotificationTypes> allowedNotifications,
  }) = _AccountSettings;

  factory AccountSettings.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsFromJson(json);
}

enum AppSecurityType {
  none,
  biometrics,
  pin,
}

enum AppBrightness {
  system,
  light,
  dark,
}

enum NotificationTypes {
  expenseAlert,
  budget,
  tipsAndArticles,
  newFeatures;
}
