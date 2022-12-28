// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      isDarkMode: json['isDarkMode'] as bool,
      onboardingStatus:
          $enumDecode(_$OnboardingStatusEnumMap, json['onboardingStatus']),
    );

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) =>
    <String, dynamic>{
      'isDarkMode': instance.isDarkMode,
      'onboardingStatus': _$OnboardingStatusEnumMap[instance.onboardingStatus]!,
    };

const _$OnboardingStatusEnumMap = {
  OnboardingStatus.notStarted: 'notStarted',
  OnboardingStatus.inProgress: 'inProgress',
  OnboardingStatus.completed: 'completed',
};
