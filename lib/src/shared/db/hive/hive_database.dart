import 'dart:async';

import 'package:gaude/src/shared/db/database.dart';
import 'package:gaude/src/shared/db/exceptions.dart';
import 'package:gaude/src/shared/db/hive/hive_storage.dart';
import 'package:gaude/src/shared/db/storage.dart';
import 'package:gaude/src/shared/interfaces/external_connection.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase implements Database, ExternalConnection {
  HiveDatabase([HiveInterface? hive]) : _hive = hive ?? Hive;
  final HiveInterface _hive;
  bool _isActive = false;

  @override
  bool get isActive => _isActive;

  @override
  Future<Storage> getStorage(String name) async {
    try {
      final box = await _hive.openBox<String>(name);
      return HiveStorage(box);
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }

  @override
  Future<void> start() async {
    try {
      await _hive.initFlutter();
      _isActive = true;
    } on Exception catch (e, s) {
      throw DatabaseException('Failed to initialize Hive:$e', stackTrace: s);
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _hive.close();
      _isActive = false;
    } catch (e, s) {
      throw DatabaseException('Failed to close Hive: $e', stackTrace: s);
    }
  }
}
