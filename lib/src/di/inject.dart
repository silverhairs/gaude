import 'package:gaude/src/shared/shared.dart';
import 'package:get_it/get_it.dart';

/// An utility function to resolve dependencies from the injector.
T inject<T extends Object>([String? name]) {
  try {
    return GetIt.instance<T>(instanceName: name);
  } on Error {
    throw InjectorException(T, name: name);
  } on Exception {
    throw InjectorException(T, name: name);
  }
}

class InjectorException extends GaudeException {
  const InjectorException(this.type, {this.name})
      : super(
          'Failed to resolve dependency of type $type '
          '${name != null ? 'with name $name ' : ''}did you forget to register it?',
        );
  final Type type;
  final String? name;
}
