abstract class GaudeException implements Exception {
  const GaudeException(this.message);
  final String? message;

  @override
  String toString() => '$runtimeType: $message';
}

class DataSourceException extends GaudeException {
  const DataSourceException(String message) : super(message);
}
