import 'dart:async';

import 'package:gaude/src/features/authentication/data/models/account_credential.dart';
import 'package:gaude/src/features/authentication/data/sources/credential_data_source.dart';
import 'package:gaude/src/features/authentication/logic/repositories/account_credential_repository.dart';
import 'package:gaude/src/shared/shared.dart';

class AccountCredentialRepositoryImpl implements AccountCredentialRepository {
  const AccountCredentialRepositoryImpl(AccountCredentialDataSource source)
      : _source = source;

  final AccountCredentialDataSource _source;

  @override
  FutureOr<Result<AccountCredential>> getCredential() async {
    try {
      final credential = await _source.getAccountCredential();
      return Result(credential);
    } catch (e, s) {
      final failure = Failure(e, s);
      return Result.failure(failure);
    }
  }

  @override
  FutureOr<Result<void>> invalidateCrendential() async {
    try {
      return Result(await _source.invalidateAccountCredential());
    } catch (e, s) {
      final failure = Failure(e, s);
      return Result.failure(failure);
    }
  }
}
