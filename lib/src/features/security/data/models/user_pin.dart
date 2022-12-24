import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_pin.freezed.dart';
part 'user_pin.g.dart';

@freezed
class UserPin with _$UserPin {
  const factory UserPin({
    required String pin,
  }) = _UserPin;

  factory UserPin.fromJson(Map<String, dynamic> json) =>
      _$UserPinFromJson(json);
}
