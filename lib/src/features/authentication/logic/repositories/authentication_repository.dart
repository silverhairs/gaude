import 'dart:async';

import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/models/result.dart';

abstract class AuthenticationRepository {
  FutureOr<Result<Account>> login(AccountCredential credential);
  FutureOr<Result<void>> logout();
  Stream<Result<Account?>> get accountAuthStateChanges;
}
