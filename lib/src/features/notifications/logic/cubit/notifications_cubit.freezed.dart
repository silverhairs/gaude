// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(Failure failure) failed,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(Failure failure)? failed,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(Failure failure)? failed,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoaded value) loaded,
    required TResult Function(_NotificationsFailed value) failed,
    required TResult Function(_NotificationsLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoaded value)? loaded,
    TResult? Function(_NotificationsFailed value)? failed,
    TResult? Function(_NotificationsLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoaded value)? loaded,
    TResult Function(_NotificationsFailed value)? failed,
    TResult Function(_NotificationsLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NotificationsInitialCopyWith<$Res> {
  factory _$$_NotificationsInitialCopyWith(_$_NotificationsInitial value,
          $Res Function(_$_NotificationsInitial) then) =
      __$$_NotificationsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotificationsInitialCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsInitial>
    implements _$$_NotificationsInitialCopyWith<$Res> {
  __$$_NotificationsInitialCopyWithImpl(_$_NotificationsInitial _value,
      $Res Function(_$_NotificationsInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotificationsInitial implements _NotificationsInitial {
  const _$_NotificationsInitial();

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotificationsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(Failure failure) failed,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(Failure failure)? failed,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(Failure failure)? failed,
    TResult Function()? loading,
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
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoaded value) loaded,
    required TResult Function(_NotificationsFailed value) failed,
    required TResult Function(_NotificationsLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoaded value)? loaded,
    TResult? Function(_NotificationsFailed value)? failed,
    TResult? Function(_NotificationsLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoaded value)? loaded,
    TResult Function(_NotificationsFailed value)? failed,
    TResult Function(_NotificationsLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _NotificationsInitial implements NotificationsState {
  const factory _NotificationsInitial() = _$_NotificationsInitial;
}

/// @nodoc
abstract class _$$_NotificationsLoadedCopyWith<$Res> {
  factory _$$_NotificationsLoadedCopyWith(_$_NotificationsLoaded value,
          $Res Function(_$_NotificationsLoaded) then) =
      __$$_NotificationsLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationModel> notifications});
}

/// @nodoc
class __$$_NotificationsLoadedCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsLoaded>
    implements _$$_NotificationsLoadedCopyWith<$Res> {
  __$$_NotificationsLoadedCopyWithImpl(_$_NotificationsLoaded _value,
      $Res Function(_$_NotificationsLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$_NotificationsLoaded(
      null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$_NotificationsLoaded implements _NotificationsLoaded {
  const _$_NotificationsLoaded(final List<NotificationModel> notifications)
      : _notifications = notifications;

  final List<NotificationModel> _notifications;
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsState.loaded(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsLoaded &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsLoadedCopyWith<_$_NotificationsLoaded> get copyWith =>
      __$$_NotificationsLoadedCopyWithImpl<_$_NotificationsLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(Failure failure) failed,
    required TResult Function() loading,
  }) {
    return loaded(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(Failure failure)? failed,
    TResult? Function()? loading,
  }) {
    return loaded?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(Failure failure)? failed,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoaded value) loaded,
    required TResult Function(_NotificationsFailed value) failed,
    required TResult Function(_NotificationsLoading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoaded value)? loaded,
    TResult? Function(_NotificationsFailed value)? failed,
    TResult? Function(_NotificationsLoading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoaded value)? loaded,
    TResult Function(_NotificationsFailed value)? failed,
    TResult Function(_NotificationsLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _NotificationsLoaded implements NotificationsState {
  const factory _NotificationsLoaded(
      final List<NotificationModel> notifications) = _$_NotificationsLoaded;

  List<NotificationModel> get notifications;
  @JsonKey(ignore: true)
  _$$_NotificationsLoadedCopyWith<_$_NotificationsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationsFailedCopyWith<$Res> {
  factory _$$_NotificationsFailedCopyWith(_$_NotificationsFailed value,
          $Res Function(_$_NotificationsFailed) then) =
      __$$_NotificationsFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$_NotificationsFailedCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsFailed>
    implements _$$_NotificationsFailedCopyWith<$Res> {
  __$$_NotificationsFailedCopyWithImpl(_$_NotificationsFailed _value,
      $Res Function(_$_NotificationsFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_NotificationsFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_NotificationsFailed implements _NotificationsFailed {
  const _$_NotificationsFailed(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'NotificationsState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsFailed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsFailedCopyWith<_$_NotificationsFailed> get copyWith =>
      __$$_NotificationsFailedCopyWithImpl<_$_NotificationsFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(Failure failure) failed,
    required TResult Function() loading,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(Failure failure)? failed,
    TResult? Function()? loading,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(Failure failure)? failed,
    TResult Function()? loading,
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
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoaded value) loaded,
    required TResult Function(_NotificationsFailed value) failed,
    required TResult Function(_NotificationsLoading value) loading,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoaded value)? loaded,
    TResult? Function(_NotificationsFailed value)? failed,
    TResult? Function(_NotificationsLoading value)? loading,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoaded value)? loaded,
    TResult Function(_NotificationsFailed value)? failed,
    TResult Function(_NotificationsLoading value)? loading,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _NotificationsFailed implements NotificationsState {
  const factory _NotificationsFailed(final Failure failure) =
      _$_NotificationsFailed;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_NotificationsFailedCopyWith<_$_NotificationsFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationsLoadingCopyWith<$Res> {
  factory _$$_NotificationsLoadingCopyWith(_$_NotificationsLoading value,
          $Res Function(_$_NotificationsLoading) then) =
      __$$_NotificationsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotificationsLoadingCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsLoading>
    implements _$$_NotificationsLoadingCopyWith<$Res> {
  __$$_NotificationsLoadingCopyWithImpl(_$_NotificationsLoading _value,
      $Res Function(_$_NotificationsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotificationsLoading implements _NotificationsLoading {
  const _$_NotificationsLoading();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotificationsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(Failure failure) failed,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(Failure failure)? failed,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(Failure failure)? failed,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoaded value) loaded,
    required TResult Function(_NotificationsFailed value) failed,
    required TResult Function(_NotificationsLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoaded value)? loaded,
    TResult? Function(_NotificationsFailed value)? failed,
    TResult? Function(_NotificationsLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoaded value)? loaded,
    TResult Function(_NotificationsFailed value)? failed,
    TResult Function(_NotificationsLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _NotificationsLoading implements NotificationsState {
  const factory _NotificationsLoading() = _$_NotificationsLoading;
}
