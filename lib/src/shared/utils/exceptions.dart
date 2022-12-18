import 'package:gaude/src/shared/models/failure.dart';

abstract class GaudeException implements Exception {
  const GaudeException(this.message, {required this.stackTrace});
  final String? message;
  final StackTrace stackTrace;

  @override
  String toString() => '$runtimeType: $message';

  Failure toFailure() => Failure(this, stackTrace);
}

class DataSourceException extends GaudeException {
  const DataSourceException(super.message, {required super.stackTrace});
}
