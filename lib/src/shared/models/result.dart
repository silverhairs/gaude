import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/shared/models/failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result(T data) = _ResultSuccess<T>;
  const factory Result.failure(Failure failure) = _ResultFailure<T>;
}

extension ResultExt on Result {
  bool get isSuccess => this is _ResultSuccess;
  bool get isFailure => this is _ResultFailure;
}
