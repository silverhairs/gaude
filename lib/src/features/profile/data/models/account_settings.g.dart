// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountSettings _$$_AccountSettingsFromJson(Map<String, dynamic> json) =>
    _$_AccountSettings(
      currency: const _CurrencyConverter()
          .fromJson(json['currency'] as Map<String, dynamic>),
      security:
          $enumDecodeNullable(_$AppSecurityTypeEnumMap, json['security']) ??
              AppSecurityType.none,
      brightness:
          $enumDecodeNullable(_$AppBrightnessEnumMap, json['brightness']) ??
              AppBrightness.system,
      allowedNotifications: (json['allowedNotifications'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$NotificationTypesEnumMap, e))
              .toList() ??
          const <NotificationTypes>[],
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_AccountSettingsToJson(_$_AccountSettings instance) =>
    <String, dynamic>{
      'currency': const _CurrencyConverter().toJson(instance.currency),
      'security': _$AppSecurityTypeEnumMap[instance.security]!,
      'brightness': _$AppBrightnessEnumMap[instance.brightness]!,
      'allowedNotifications': instance.allowedNotifications
          .map((e) => _$NotificationTypesEnumMap[e]!)
          .toList(),
      'updatedAt': instance.updatedAt.toIso8601String(),
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
