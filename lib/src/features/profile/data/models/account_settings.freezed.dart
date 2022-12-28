// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) {
  return _AccountSettings.fromJson(json);
}

/// @nodoc
mixin _$AccountSettings {
  @_CurrencyConverter()
  Currency get currency => throw _privateConstructorUsedError;
  AppSecurityType get security => throw _privateConstructorUsedError;
  AppBrightness get brightness => throw _privateConstructorUsedError;
  List<NotificationTypes> get allowedNotifications =>
      throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountSettingsCopyWith<AccountSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSettingsCopyWith<$Res> {
  factory $AccountSettingsCopyWith(
          AccountSettings value, $Res Function(AccountSettings) then) =
      _$AccountSettingsCopyWithImpl<$Res, AccountSettings>;
  @useResult
  $Res call(
      {@_CurrencyConverter() Currency currency,
      AppSecurityType security,
      AppBrightness brightness,
      List<NotificationTypes> allowedNotifications,
      DateTime updatedAt});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$AccountSettingsCopyWithImpl<$Res, $Val extends AccountSettings>
    implements $AccountSettingsCopyWith<$Res> {
  _$AccountSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? security = null,
    Object? brightness = null,
    Object? allowedNotifications = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      security: null == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as AppSecurityType,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as AppBrightness,
      allowedNotifications: null == allowedNotifications
          ? _value.allowedNotifications
          : allowedNotifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationTypes>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountSettingsCopyWith<$Res>
    implements $AccountSettingsCopyWith<$Res> {
  factory _$$_AccountSettingsCopyWith(
          _$_AccountSettings value, $Res Function(_$_AccountSettings) then) =
      __$$_AccountSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_CurrencyConverter() Currency currency,
      AppSecurityType security,
      AppBrightness brightness,
      List<NotificationTypes> allowedNotifications,
      DateTime updatedAt});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$_AccountSettingsCopyWithImpl<$Res>
    extends _$AccountSettingsCopyWithImpl<$Res, _$_AccountSettings>
    implements _$$_AccountSettingsCopyWith<$Res> {
  __$$_AccountSettingsCopyWithImpl(
      _$_AccountSettings _value, $Res Function(_$_AccountSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? security = null,
    Object? brightness = null,
    Object? allowedNotifications = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_AccountSettings(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      security: null == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as AppSecurityType,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as AppBrightness,
      allowedNotifications: null == allowedNotifications
          ? _value._allowedNotifications
          : allowedNotifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationTypes>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$_AccountSettings implements _AccountSettings {
  const _$_AccountSettings(
      {@_CurrencyConverter() required this.currency,
      this.security = AppSecurityType.none,
      this.brightness = AppBrightness.system,
      final List<NotificationTypes> allowedNotifications =
          const <NotificationTypes>[],
      required this.updatedAt})
      : _allowedNotifications = allowedNotifications;

  factory _$_AccountSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AccountSettingsFromJson(json);

  @override
  @_CurrencyConverter()
  final Currency currency;
  @override
  @JsonKey()
  final AppSecurityType security;
  @override
  @JsonKey()
  final AppBrightness brightness;
  final List<NotificationTypes> _allowedNotifications;
  @override
  @JsonKey()
  List<NotificationTypes> get allowedNotifications {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedNotifications);
  }

  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AccountSettings(currency: $currency, security: $security, brightness: $brightness, allowedNotifications: $allowedNotifications, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSettings &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.security, security) ||
                other.security == security) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            const DeepCollectionEquality()
                .equals(other._allowedNotifications, _allowedNotifications) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currency, security, brightness,
      const DeepCollectionEquality().hash(_allowedNotifications), updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountSettingsCopyWith<_$_AccountSettings> get copyWith =>
      __$$_AccountSettingsCopyWithImpl<_$_AccountSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountSettingsToJson(
      this,
    );
  }
}

abstract class _AccountSettings implements AccountSettings {
  const factory _AccountSettings(
      {@_CurrencyConverter() required final Currency currency,
      final AppSecurityType security,
      final AppBrightness brightness,
      final List<NotificationTypes> allowedNotifications,
      required final DateTime updatedAt}) = _$_AccountSettings;

  factory _AccountSettings.fromJson(Map<String, dynamic> json) =
      _$_AccountSettings.fromJson;

  @override
  @_CurrencyConverter()
  Currency get currency;
  @override
  AppSecurityType get security;
  @override
  AppBrightness get brightness;
  @override
  List<NotificationTypes> get allowedNotifications;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSettingsCopyWith<_$_AccountSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
