import 'package:gaude/src/shared/shared.dart';
import 'package:kiwi/kiwi.dart';

/// An utility function to resolve dependencies from the injector.
T inject<T extends Object>([String? name]) {
  // try {
  return KiwiContainer().resolve(name);
  // } on Error {
  //   throw InjectorException(T, name: name, stackTrace: StackTrace.current);
  // } on Exception {
  //   throw InjectorException(T, name: name, stackTrace: StackTrace.current);
  // }
}

class InjectorException extends GaudeException {
  InjectorException(this.type, {this.name, required StackTrace stackTrace})
      : super(
          'Failed to resolve dependency of type $type '
          '${name != null ? 'with name $name ' : ''}did you forget to register it?',
          stackTrace: stackTrace,
        );
  final Type type;
  final String? name;
}
