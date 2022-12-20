import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@Freezed(unionValueCase: FreezedUnionCase.snake)
class Currency with _$Currency {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Currency({
    required String code,
    required String name,
    required String symbol,
    @Default(2) int decimalDigits,
    @Default(true) symbolOnLeft,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
