import 'dart:async';

import 'package:gaude/src/shared/db/database.dart';
import 'package:gaude/src/shared/db/exceptions.dart';
import 'package:gaude/src/shared/db/hive/hive_storage.dart';
import 'package:gaude/src/shared/db/storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase implements Database {
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
    } catch (e) {
      throw DatabaseException('$e');
    }
  }

  @override
  Future<void> start() async {
    try {
      await _hive.initFlutter();
      _isActive = true;
    } on Exception {
      throw const DatabaseException('Failed to initialize Hive');
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _hive.close();
      _isActive = false;
    } catch (e) {
      throw DatabaseException('Failed to close Hive: $e');
    }
  }
}
