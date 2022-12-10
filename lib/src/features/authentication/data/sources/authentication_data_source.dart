import 'package:gaude/src/features/authentication/data/models/account.dart';
import 'package:gaude/src/features/authentication/data/models/account_credential.dart';

abstract class AuthenticationDataSource {
  Future<Account> login(AccountCredential credential);

  Future<void> logout();

  Stream<Account?> get accountAuthStateChanges;
}
