// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) =>
    AccountSettings(
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      security: $enumDecode(_$AppSecurityTypeEnumMap, json['security']),
      brightness: $enumDecode(_$AppBrightnessEnumMap, json['brightness']),
      allowedNotifications: (json['allowed_notifications'] as List<dynamic>)
          .map((e) => $enumDecode(_$NotificationTypesEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$AccountSettingsToJson(AccountSettings instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'security': _$AppSecurityTypeEnumMap[instance.security]!,
      'brightness': _$AppBrightnessEnumMap[instance.brightness]!,
      'allowed_notifications': instance.allowedNotifications
          .map((e) => _$NotificationTypesEnumMap[e]!)
          .toList(),
    };

const _$AppSecurityTypeEnumMap = {
  AppSecurityType.none: 'none',
  AppSecurityType.biometrics: 'biometrics',
  AppSecurityType.pin: 'pin',
};

const _$AppBrightnessEnumMap = {
  AppBrightness.system: 'system',
  AppBrightness.light: 'light',
  AppBrightness.dark: 'dark',
};

const _$NotificationTypesEnumMap = {
  NotificationTypes.expenseAlert: 'expenseAlert',
  NotificationTypes.budget: 'budget',
  NotificationTypes.tipsAndArticles: 'tipsAndArticles',
  NotificationTypes.newFeatures: 'newFeatures',
};

_$_AccountSettings _$$_AccountSettingsFromJson(Map<String, dynamic> json) =>
    _$_AccountSettings(
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      security:
          $enumDecodeNullable(_$AppSecurityTypeEnumMap, json['security']) ??
              AppSecurityType.none,
      brightness:
          $enumDecodeNullable(_$AppBrightnessEnumMap, json['brightness']) ??
              AppBrightness.system,
      allowedNotifications: (json['allowedNotifications'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$NotificationTypesEnumMap, e))
              .toSet() ??
          const <NotificationTypes>[],
    );

Map<String, dynamic> _$$_AccountSettingsToJson(_$_AccountSettings instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'security': _$AppSecurityTypeEnumMap[instance.security]!,
      'brightness': _$AppBrightnessEnumMap[instance.brightness]!,
      'allowedNotifications': instance.allowedNotifications
          .map((e) => _$NotificationTypesEnumMap[e]!)
          .toList(),
    };
