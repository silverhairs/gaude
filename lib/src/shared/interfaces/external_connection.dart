import 'dart:async';

abstract class ExternalConnection {
  FutureOr<void> start();
  FutureOr<void> stop();
  bool get isActive;
}
