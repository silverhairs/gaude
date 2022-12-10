import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account_credential.dart';

abstract class AccountCredentialDataSource {
  FutureOr<AccountCredential> getAccountCredential();
  FutureOr<void> invalidateAccountCredential();
}
