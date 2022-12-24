// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPin _$UserPinFromJson(Map<String, dynamic> json) {
  return _UserPin.fromJson(json);
}

/// @nodoc
mixin _$UserPin {
  String get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPinCopyWith<UserPin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPinCopyWith<$Res> {
  factory $UserPinCopyWith(UserPin value, $Res Function(UserPin) then) =
      _$UserPinCopyWithImpl<$Res, UserPin>;
  @useResult
  $Res call({String pin});
}

/// @nodoc
class _$UserPinCopyWithImpl<$Res, $Val extends UserPin>
    implements $UserPinCopyWith<$Res> {
  _$UserPinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPinCopyWith<$Res> implements $UserPinCopyWith<$Res> {
  factory _$$_UserPinCopyWith(
          _$_UserPin value, $Res Function(_$_UserPin) then) =
      __$$_UserPinCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pin});
}

/// @nodoc
class __$$_UserPinCopyWithImpl<$Res>
    extends _$UserPinCopyWithImpl<$Res, _$_UserPin>
    implements _$$_UserPinCopyWith<$Res> {
  __$$_UserPinCopyWithImpl(_$_UserPin _value, $Res Function(_$_UserPin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_$_UserPin(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPin implements _UserPin {
  const _$_UserPin({required this.pin});

  factory _$_UserPin.fromJson(Map<String, dynamic> json) =>
      _$$_UserPinFromJson(json);

  @override
  final String pin;

  @override
  String toString() {
    return 'UserPin(pin: $pin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPin &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPinCopyWith<_$_UserPin> get copyWith =>
      __$$_UserPinCopyWithImpl<_$_UserPin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPinToJson(
      this,
    );
  }
}

abstract class _UserPin implements UserPin {
  const factory _UserPin({required final String pin}) = _$_UserPin;

  factory _UserPin.fromJson(Map<String, dynamic> json) = _$_UserPin.fromJson;

  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$_UserPinCopyWith<_$_UserPin> get copyWith =>
      throw _privateConstructorUsedError;
}
