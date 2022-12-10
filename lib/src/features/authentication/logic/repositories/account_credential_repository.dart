import 'dart:async';

import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class AccountCredentialRepository {
  FutureOr<Result<AccountCredential>> getCredential();
  FutureOr<Result<void>> invalidateCrendential();
}
