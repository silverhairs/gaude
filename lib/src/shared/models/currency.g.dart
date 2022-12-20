// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      code: json['code'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      decimalDigits: json['decimal_digits'] as int? ?? 2,
      symbolOnLeft: json['symbol_on_left'] ?? true,
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
      'decimal_digits': instance.decimalDigits,
      'symbol_on_left': instance.symbolOnLeft,
    };
