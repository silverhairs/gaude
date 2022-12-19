import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account_user.dart';

abstract class AccountDataSource {
  FutureOr<AccountUser?> getAccount(String id);
  FutureOr<void> saveAccount(AccountUser account);
  FutureOr<void> deleteAccount(String id);
}
