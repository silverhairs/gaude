import 'dart:async';

import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/models/result.dart';

abstract class AuthenticationRepository {
  FutureOr<Result<AccountUser>> login(AccountCredential credential);
  FutureOr<Result<void>> logout();
  Stream<Result<AccountUser?>> get accountAuthStateChanges;
}
