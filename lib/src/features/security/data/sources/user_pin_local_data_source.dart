import 'dart:async';

import 'package:gaude/src/features/security/data/models/user_pin.dart';
import 'package:gaude/src/features/security/data/sources/user_pin_data_source.dart';
import 'package:gaude/src/shared/shared.dart';

class UserPinLocalDataSource implements UserPinDataSource {
  UserPinLocalDataSource(Database db) : _db = db;
  final Database _db;
  static Storage? _storage;

  @override
  FutureOr<UserPin?> getUserPin() async {
    try {
      final storage = await _getStorage();
      final userPinJson = await storage.read('user_pin');
      if (userPinJson != null) {
        return UserPin.fromJson(userPinJson);
      }
      return null;
    } catch (_, s) {
      throw DataSourceException('Failed to set user pin', stackTrace: s);
    }
  }

  @override
  Future<void> setUserPin(UserPin userPin) async {
    try {
      final storage = await _getStorage();
      await storage.write('user_pin', userPin.toJson());
    } catch (_, s) {
      throw DataSourceException('Failed to set user pin', stackTrace: s);
    }
  }

  FutureOr<Storage> _getStorage() async {
    final storage = _storage ??= await _db.getStorage('security');
    return storage;
  }
}
