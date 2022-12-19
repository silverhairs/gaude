import 'package:gaude/src/features/authentication/data/models/account_credential.dart';
import 'package:gaude/src/features/authentication/data/models/account_user.dart';

abstract class AuthenticationDataSource {
  Future<AccountUser> login(AccountCredential credential);

  Future<void> logout();

  Stream<AccountUser?> get accountAuthStateChanges;
}
