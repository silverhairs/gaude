import 'dart:async';

import 'package:gaude/src/features/profile/data/models/account.dart';

abstract class AccountDataSource {
  FutureOr<Account?> getAccount(String id);
  FutureOr<void> saveAccount(Account account);
  FutureOr<void> deleteAccount(String id);
}
