import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account.dart';
import 'package:gaude/src/features/authentication/data/models/account_credential.dart';
import 'package:gaude/src/features/authentication/data/sources/authentication_data_source.dart';
import 'package:gaude/src/features/authentication/logic/repositories/authentication_repository.dart';
import 'package:gaude/src/shared/shared.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(AuthenticationDataSource dataSource)
      : _source = dataSource;

  final AuthenticationDataSource _source;

  @override
  Stream<Result<Account?>> get accountAuthStateChanges async* {
    try {
      await for (final account in _source.accountAuthStateChanges) {
        yield Result(account);
      }
    } catch (e, s) {
      yield Result.failure(Failure(e, s));
    }
  }

  @override
  FutureOr<Result<Account>> login(AccountCredential credential) async {
    try {
      final account = await _source.login(credential);
      return Result(account);
    } catch (e, s) {
      final failure = Failure(e, s);
      return Result.failure(failure);
    }
  }

  @override
  FutureOr<Result<void>> logout() async {
    try {
      return Result(await _source.logout());
    } catch (e, s) {
      final failure = Failure(e, s);
      return Result.failure(failure);
    }
  }
}
