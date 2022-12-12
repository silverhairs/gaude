import 'dart:async';

import 'package:gaude/src/shared/db/storage.dart';

abstract class Database {
  Future<void> start();
  Future<void> stop();
  bool get isActive;
  FutureOr<Storage> getStorage(String name);
}
