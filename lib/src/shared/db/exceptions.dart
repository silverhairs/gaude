import 'package:gaude/src/shared/utils/exceptions.dart';

class DatabaseException extends GaudeException {
  const DatabaseException(super.message, {required super.stackTrace});
}
