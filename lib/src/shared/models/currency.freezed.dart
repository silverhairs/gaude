// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  int get decimalDigits => throw _privateConstructorUsedError;
  dynamic get symbolOnLeft => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {String code,
      String name,
      String symbol,
      int decimalDigits,
      dynamic symbolOnLeft});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
    Object? decimalDigits = null,
    Object? symbolOnLeft = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimalDigits: null == decimalDigits
          ? _value.decimalDigits
          : decimalDigits // ignore: cast_nullable_to_non_nullable
              as int,
      symbolOnLeft: null == symbolOnLeft
          ? _value.symbolOnLeft
          : symbolOnLeft // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$$_CurrencyCopyWith(
          _$_Currency value, $Res Function(_$_Currency) then) =
      __$$_CurrencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String symbol,
      int decimalDigits,
      dynamic symbolOnLeft});
}

/// @nodoc
class __$$_CurrencyCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$_Currency>
    implements _$$_CurrencyCopyWith<$Res> {
  __$$_CurrencyCopyWithImpl(
      _$_Currency _value, $Res Function(_$_Currency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
    Object? decimalDigits = null,
    Object? symbolOnLeft = null,
  }) {
    return _then(_$_Currency(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimalDigits: null == decimalDigits
          ? _value.decimalDigits
          : decimalDigits // ignore: cast_nullable_to_non_nullable
              as int,
      symbolOnLeft: null == symbolOnLeft ? _value.symbolOnLeft : symbolOnLeft,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Currency implements _Currency {
  const _$_Currency(
      {required this.code,
      required this.name,
      required this.symbol,
      this.decimalDigits = 2,
      this.symbolOnLeft = true});

  factory _$_Currency.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String symbol;
  @override
  @JsonKey()
  final int decimalDigits;
  @override
  @JsonKey()
  final dynamic symbolOnLeft;

  @override
  String toString() {
    return 'Currency(code: $code, name: $name, symbol: $symbol, decimalDigits: $decimalDigits, symbolOnLeft: $symbolOnLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Currency &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.decimalDigits, decimalDigits) ||
                other.decimalDigits == decimalDigits) &&
            const DeepCollectionEquality()
                .equals(other.symbolOnLeft, symbolOnLeft));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, symbol,
      decimalDigits, const DeepCollectionEquality().hash(symbolOnLeft));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      __$$_CurrencyCopyWithImpl<_$_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {required final String code,
      required final String name,
      required final String symbol,
      final int decimalDigits,
      final dynamic symbolOnLeft}) = _$_Currency;

  factory _Currency.fromJson(Map<String, dynamic> json) = _$_Currency.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get symbol;
  @override
  int get decimalDigits;
  @override
  dynamic get symbolOnLeft;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}
