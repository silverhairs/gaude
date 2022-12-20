import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/shared/shared.dart';

part 'account_settings.freezed.dart';
part 'account_settings.g.dart';

@Freezed(unionValueCase: FreezedUnionCase.snake)
class AccountSettings with _$AccountSettings {
  const factory AccountSettings({
    required Currency currency,
    @Default(AppSecurityType.none) AppSecurityType security,
    @Default(AppBrightness.system) AppBrightness brightness,
    @Default(<NotificationTypes>[])
        List<NotificationTypes> allowedNotifications,
    required DateTime updatedAt,
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
