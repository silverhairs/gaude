import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaude/src/features/authentication/data/models/account_credential.dart';
import 'package:gaude/src/features/authentication/data/models/account_user.dart';
import 'package:gaude/src/features/authentication/data/sources/authentication_data_source.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';

class AuthenticationFirebaseDataSource implements AuthenticationDataSource {
  const AuthenticationFirebaseDataSource(FirebaseAuth auth) : _auth = auth;
  final FirebaseAuth _auth;

  @override
  Stream<AccountUser?> get accountAuthStateChanges async* {
    await for (final user in _auth.authStateChanges()) {
      yield user == null
          ? null
          : AccountUser(
              id: user.uid,
              email: user.email!,
              name: user.displayName!,
              photoUrl: user.photoURL!,
            );
    }
  }

  @override
  Future<AccountUser> login(AccountCredential credential) async {
    try {
      if (credential is! GoogleAccountCredential) {
        throw UnimplementedError('Currently only support Google sign in.');
      }
      final authCredential = GoogleAuthProvider.credential(
        accessToken: credential.accessToken,
        idToken: credential.idToken,
      );
      final userCredential = await _auth.signInWithCredential(authCredential);
      final user = userCredential.user!;
      return AccountUser(
        id: user.uid,
        email: user.email!,
        name: user.displayName!,
        photoUrl: user.photoURL!,
      );
    } on DataSourceException {
      rethrow;
    } on UnimplementedError {
      throw DataSourceException(
        'Currently only support Google sign in.',
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw DataSourceException(
        'Failed to login: $e',
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
