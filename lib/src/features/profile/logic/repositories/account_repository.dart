import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class AccountRepository {
  FutureOr<Result<Account?>> getAccount(String id);
  FutureOr<Result<void>> saveAccount(Account account);
  FutureOr<Result<void>> deleteAccount(String id);
  FutureOr<Result<Account>> backup(Account account);
}
