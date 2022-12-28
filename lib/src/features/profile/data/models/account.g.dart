// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      user: const _AccountUserJsonConverter()
          .fromJson(json['user'] as Map<String, dynamic>),
      settings: _$JsonConverterFromJson<Map<String, dynamic>, AccountSettings>(
          json['settings'], const _AccountSettingsJsonConverter().fromJson),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'user': const _AccountUserJsonConverter().toJson(instance.user),
      'settings': _$JsonConverterToJson<Map<String, dynamic>, AccountSettings>(
          instance.settings, const _AccountSettingsJsonConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
