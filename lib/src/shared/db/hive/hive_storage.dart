import 'dart:async';
import 'dart:convert';

import 'package:gaude/src/shared/db/exceptions.dart';
import 'package:gaude/src/shared/db/storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage implements Storage<Map<String, dynamic>> {
  HiveStorage(Box<String> box) : _box = box;
  final Box<String> _box;

  @override
  Future<void> close() async {
    try {
      await _box.close();
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _box.delete(key);
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      await _box.clear();
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }

  @override
  Map<String, dynamic>? read(String key) {
    try {
      final data = _box.get(key) ?? '{}';
      return json.decode(data) as Map<String, dynamic>;
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }

  @override
  List<Map<String, dynamic>> readAll() {
    try {
      return _box.values
          .map((value) => json.decode(value) as Map<String, dynamic>)
          .toList();
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }

  @override
  Future<void> write(String key, Map<String, dynamic> data) async {
    try {
      await _box.put(key, json.encode(data));
    } catch (e, s) {
      throw DatabaseException('$e', stackTrace: s);
    }
  }
}
