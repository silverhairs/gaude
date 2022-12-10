import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account_credential.dart';
import 'package:gaude/src/features/authentication/data/sources/credential_data_source.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAccountCredentialDataSource implements AccountCredentialDataSource {
  final GoogleSignIn _googleSignIn;

  GoogleAccountCredentialDataSource(this._googleSignIn);

  @override
  FutureOr<GoogleAccountCredential> getAccountCredential() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      final googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      return GoogleAccountCredential(
        accessToken: googleSignInAuthentication.accessToken!,
        idToken: googleSignInAuthentication.idToken!,
      );
    } on Exception catch (e) {
      throw DataSourceException(e.toString());
    }
  }

  @override
  Future<void> invalidateAccountCredential() async {
    try {
      await _googleSignIn.signOut();
    } on Exception catch (e) {
      throw DataSourceException(e.toString());
    }
  }
}
