import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FakeHive extends Fake implements HiveInterface {
  @override
  void init(String? path, {HiveStorageBackendPreference? backendPreference}) {
    return;
  }

  final Map<String, Box> _boxes = {};

  @override
  Future<Box<E>> openBox<E>(
    String name, {
    HiveCipher? encryptionCipher,
    KeyComparator? keyComparator,
    CompactionStrategy? compactionStrategy,
    bool crashRecovery = true,
    String? path,
    Uint8List? bytes,
    String? collection,
    List<int>? encryptionKey,
  }) {
    if (_boxes.containsKey(name)) {
      return Future.value(_boxes[name] as Box<E>);
    }
    final box = FakeBox<E>(name);
    _boxes[name] = box;
    return Future.value(box);
  }

  @override
  Future<void> close() async {
    _boxes.clear();
  }

  @override
  Future<void> deleteBoxFromDisk(String name, {String? path}) async {
    _boxes.remove(name);
  }
}

class FakeBox<E> extends Fake implements Box<E> {
  FakeBox(this.name);
  final Map<dynamic, E> _map = {};
  bool _isOpen = true;

  @override
  final String name;

  @override
  Future<int> add(E value) {
    final index = _map.length;
    _map[index] = value;
    return Future.value(index);
  }

  @override
  Future<Iterable<int>> addAll(Iterable<E> values) async {
    final indexes = <int>[];
    for (final value in values) {
      final index = _map.length;
      _map[index] = value;
      indexes.add(index);
    }
    return indexes;
  }

  @override
  Future<int> clear() async {
    _map.clear();
    return _map.length;
  }

  @override
  Future<void> close() async {
    await clear();
    _isOpen = false;
  }

  @override
  bool containsKey(key) => _map.containsKey(key);

  @override
  Future<void> delete(key) async {
    _map.remove(key);
  }

  @override
  Future<void> deleteAll(Iterable keys) async {
    keys.forEach(_map.remove);
  }

  @override
  Future<void> deleteAt(int index) async {
    final key = _map.keys.elementAt(index);
    _map.remove(key);
  }

  @override
  Future<void> deleteFromDisk() async {
    await clear();
  }

  @override
  E? get(key, {E? defaultValue}) {
    return _map[key] ?? defaultValue;
  }

  @override
  E? getAt(int index) {
    return _map.values.elementAt(index);
  }

  @override
  bool get isEmpty => _map.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  bool get isOpen => _isOpen;

  @override
  keyAt(int index) {
    return _map.keys.elementAt(index);
  }

  @override
  Iterable get keys => _map.keys;

  @override
  bool get lazy => true;

  @override
  int get length => _map.length;

  @override
  String? get path => '/test/path';

  @override
  Future<void> put(key, E value) async {
    _map[key] = value;
  }

  @override
  Future<void> putAll(Map<dynamic, E> entries) async {
    _map.addAll(entries);
  }

  @override
  Future<void> putAt(int index, E value) async {
    final key = _map.keys.elementAt(index);
    _map[key] = value;
  }

  @override
  Map<dynamic, E> toMap() => _map;

  @override
  Iterable<E> get values => _map.values;

  @override
  Iterable<E> valuesBetween({startKey, endKey}) {
    final start = _map.keys.toList().indexOf(startKey);
    final end = _map.keys.toList().indexOf(endKey);
    return _map.values.toList().sublist(start, end);
  }

  @override
  Stream<BoxEvent> watch({key}) => const Stream.empty();
}
