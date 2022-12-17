import 'dart:async';

import 'package:gaude/src/shared/db/storage.dart';

abstract class Database {
  bool get isActive;
  FutureOr<Storage> getStorage(String name);
}
