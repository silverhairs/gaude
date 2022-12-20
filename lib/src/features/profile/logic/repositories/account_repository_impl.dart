import 'dart:async';

import 'package:gaude/src/features/profile/data/models/account.dart';
import 'package:gaude/src/features/profile/data/sources/account_data_source.dart';
import 'package:gaude/src/features/profile/logic/repositories/account_repository.dart';
import 'package:gaude/src/shared/shared.dart';

class AccountRepositoryImpl implements AccountRepository {
  const AccountRepositoryImpl(AccountDataSource source) : _source = source;

  final AccountDataSource _source;

  @override
  Future<Result<void>> deleteAccount(String id) async {
    try {
      return Result(await _source.deleteAccount(id));
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<Account?>> getAccount(String id) async {
    try {
      return Result(await _source.getAccount(id));
    } on DataSourceException catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<void>> saveAccount(Account account) async {
    try {
      return Result(await _source.saveAccount(account));
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<Account>> backup(Account account) async {
    final userResult = await getAccount(account.user.id);
    return userResult.when(
      (accountData) async {
        if (accountData == null) {
          await saveAccount(account);
        }
        return Result(accountData!);
      },
      failure: Result.failure,
    );
  }
}
