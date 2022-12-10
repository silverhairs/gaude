// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottom_tab_navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomTabNavigationState {
  BottomBarTab get tab => throw _privateConstructorUsedError;
  int get hits => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomBarTab tab, int hits) opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomBarTab tab, int hits)? opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomBarTab tab, int hits)? opened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Opened value) opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Opened value)? opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Opened value)? opened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomTabNavigationStateCopyWith<BottomTabNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomTabNavigationStateCopyWith<$Res> {
  factory $BottomTabNavigationStateCopyWith(BottomTabNavigationState value,
          $Res Function(BottomTabNavigationState) then) =
      _$BottomTabNavigationStateCopyWithImpl<$Res, BottomTabNavigationState>;
  @useResult
  $Res call({BottomBarTab tab, int hits});
}

/// @nodoc
class _$BottomTabNavigationStateCopyWithImpl<$Res,
        $Val extends BottomTabNavigationState>
    implements $BottomTabNavigationStateCopyWith<$Res> {
  _$BottomTabNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as BottomBarTab,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpenedCopyWith<$Res>
    implements $BottomTabNavigationStateCopyWith<$Res> {
  factory _$$_OpenedCopyWith(_$_Opened value, $Res Function(_$_Opened) then) =
      __$$_OpenedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BottomBarTab tab, int hits});
}

/// @nodoc
class __$$_OpenedCopyWithImpl<$Res>
    extends _$BottomTabNavigationStateCopyWithImpl<$Res, _$_Opened>
    implements _$$_OpenedCopyWith<$Res> {
  __$$_OpenedCopyWithImpl(_$_Opened _value, $Res Function(_$_Opened) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
    Object? hits = null,
  }) {
    return _then(_$_Opened(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as BottomBarTab,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Opened implements _Opened {
  const _$_Opened({this.tab = BottomBarTab.home, this.hits = 1});

  @override
  @JsonKey()
  final BottomBarTab tab;
  @override
  @JsonKey()
  final int hits;

  @override
  String toString() {
    return 'BottomTabNavigationState.opened(tab: $tab, hits: $hits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Opened &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.hits, hits) || other.hits == hits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab, hits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenedCopyWith<_$_Opened> get copyWith =>
      __$$_OpenedCopyWithImpl<_$_Opened>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomBarTab tab, int hits) opened,
  }) {
    return opened(tab, hits);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomBarTab tab, int hits)? opened,
  }) {
    return opened?.call(tab, hits);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomBarTab tab, int hits)? opened,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened(tab, hits);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Opened value) opened,
  }) {
    return opened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Opened value)? opened,
  }) {
    return opened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Opened value)? opened,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened(this);
    }
    return orElse();
  }
}

abstract class _Opened implements BottomTabNavigationState {
  const factory _Opened({final BottomBarTab tab, final int hits}) = _$_Opened;

  @override
  BottomBarTab get tab;
  @override
  int get hits;
  @override
  @JsonKey(ignore: true)
  _$$_OpenedCopyWith<_$_Opened> get copyWith =>
      throw _privateConstructorUsedError;
}
