import 'dart:async';

import 'package:gaude/src/features/profile/data/models/account.dart';

abstract class AccountDataSource {
  Future<Account?> getAccount(String id);
  Future<void> saveAccount(Account account);
  Future<void> deleteAccount(String id);
}
