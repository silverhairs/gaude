// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_lock_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLockState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLockStateCopyWith<$Res> {
  factory $AppLockStateCopyWith(
          AppLockState value, $Res Function(AppLockState) then) =
      _$AppLockStateCopyWithImpl<$Res, AppLockState>;
}

/// @nodoc
class _$AppLockStateCopyWithImpl<$Res, $Val extends AppLockState>
    implements $AppLockStateCopyWith<$Res> {
  _$AppLockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AppLockState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppLockState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<$Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated value, $Res Function(_$_Authenticated) then) =
      __$$_AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_Authenticated>
    implements _$$_AuthenticatedCopyWith<$Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated _value, $Res Function(_$_Authenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'AppLockState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AppLockState {
  const factory _Authenticated() = _$_Authenticated;
}

/// @nodoc
abstract class _$$_BiometricAvailableCopyWith<$Res> {
  factory _$$_BiometricAvailableCopyWith(_$_BiometricAvailable value,
          $Res Function(_$_BiometricAvailable) then) =
      __$$_BiometricAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BiometricAvailableCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_BiometricAvailable>
    implements _$$_BiometricAvailableCopyWith<$Res> {
  __$$_BiometricAvailableCopyWithImpl(
      _$_BiometricAvailable _value, $Res Function(_$_BiometricAvailable) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BiometricAvailable implements _BiometricAvailable {
  const _$_BiometricAvailable();

  @override
  String toString() {
    return 'AppLockState.biometricAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BiometricAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return biometricAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return biometricAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (biometricAvailable != null) {
      return biometricAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return biometricAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return biometricAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (biometricAvailable != null) {
      return biometricAvailable(this);
    }
    return orElse();
  }
}

abstract class _BiometricAvailable implements AppLockState {
  const factory _BiometricAvailable() = _$_BiometricAvailable;
}

/// @nodoc
abstract class _$$_NotUnrolledCopyWith<$Res> {
  factory _$$_NotUnrolledCopyWith(
          _$_NotUnrolled value, $Res Function(_$_NotUnrolled) then) =
      __$$_NotUnrolledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotUnrolledCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_NotUnrolled>
    implements _$$_NotUnrolledCopyWith<$Res> {
  __$$_NotUnrolledCopyWithImpl(
      _$_NotUnrolled _value, $Res Function(_$_NotUnrolled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotUnrolled implements _NotUnrolled {
  const _$_NotUnrolled();

  @override
  String toString() {
    return 'AppLockState.notUnrolled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotUnrolled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return notUnrolled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return notUnrolled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (notUnrolled != null) {
      return notUnrolled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return notUnrolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return notUnrolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (notUnrolled != null) {
      return notUnrolled(this);
    }
    return orElse();
  }
}

abstract class _NotUnrolled implements AppLockState {
  const factory _NotUnrolled() = _$_NotUnrolled;
}

/// @nodoc
abstract class _$$_UnavailableCopyWith<$Res> {
  factory _$$_UnavailableCopyWith(
          _$_Unavailable value, $Res Function(_$_Unavailable) then) =
      __$$_UnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnavailableCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_Unavailable>
    implements _$$_UnavailableCopyWith<$Res> {
  __$$_UnavailableCopyWithImpl(
      _$_Unavailable _value, $Res Function(_$_Unavailable) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unavailable implements _Unavailable {
  const _$_Unavailable();

  @override
  String toString() {
    return 'AppLockState.unavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return unavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return unavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return unavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class _Unavailable implements AppLockState {
  const factory _Unavailable() = _$_Unavailable;
}

/// @nodoc
abstract class _$$_UnauthenticatedCopyWith<$Res> {
  factory _$$_UnauthenticatedCopyWith(
          _$_Unauthenticated value, $Res Function(_$_Unauthenticated) then) =
      __$$_UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthenticatedCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_Unauthenticated>
    implements _$$_UnauthenticatedCopyWith<$Res> {
  __$$_UnauthenticatedCopyWithImpl(
      _$_Unauthenticated _value, $Res Function(_$_Unauthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'AppLockState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AppLockState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

/// @nodoc
abstract class _$$_PendingCopyWith<$Res> {
  factory _$$_PendingCopyWith(
          _$_Pending value, $Res Function(_$_Pending) then) =
      __$$_PendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PendingCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_Pending>
    implements _$$_PendingCopyWith<$Res> {
  __$$_PendingCopyWithImpl(_$_Pending _value, $Res Function(_$_Pending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Pending implements _Pending {
  const _$_Pending();

  @override
  String toString() {
    return 'AppLockState.pending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Pending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _Pending implements AppLockState {
  const factory _Pending() = _$_Pending;
}

/// @nodoc
abstract class _$$_FailedCopyWith<$Res> {
  factory _$$_FailedCopyWith(_$_Failed value, $Res Function(_$_Failed) then) =
      __$$_FailedCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$_FailedCopyWithImpl<$Res>
    extends _$AppLockStateCopyWithImpl<$Res, _$_Failed>
    implements _$$_FailedCopyWith<$Res> {
  __$$_FailedCopyWithImpl(_$_Failed _value, $Res Function(_$_Failed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_Failed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_Failed implements _Failed {
  const _$_Failed(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AppLockState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      __$$_FailedCopyWithImpl<_$_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() biometricAvailable,
    required TResult Function() notUnrolled,
    required TResult Function() unavailable,
    required TResult Function() unauthenticated,
    required TResult Function() pending,
    required TResult Function(Failure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? biometricAvailable,
    TResult? Function()? notUnrolled,
    TResult? Function()? unavailable,
    TResult? Function()? unauthenticated,
    TResult? Function()? pending,
    TResult? Function(Failure failure)? failed,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? biometricAvailable,
    TResult Function()? notUnrolled,
    TResult Function()? unavailable,
    TResult Function()? unauthenticated,
    TResult Function()? pending,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_BiometricAvailable value) biometricAvailable,
    required TResult Function(_NotUnrolled value) notUnrolled,
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_BiometricAvailable value)? biometricAvailable,
    TResult? Function(_NotUnrolled value)? notUnrolled,
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_BiometricAvailable value)? biometricAvailable,
    TResult Function(_NotUnrolled value)? notUnrolled,
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Pending value)? pending,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AppLockState {
  const factory _Failed(final Failure failure) = _$_Failed;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      throw _privateConstructorUsedError;
}
