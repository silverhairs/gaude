import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account_user.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class AccountRepository {
  FutureOr<Result<AccountUser?>> getAccount(String id);
  FutureOr<Result<void>> saveAccount(AccountUser account);
  FutureOr<Result<void>> deleteAccount(String id);
  FutureOr<Result<AccountUser>> backup(AccountUser account);
}
