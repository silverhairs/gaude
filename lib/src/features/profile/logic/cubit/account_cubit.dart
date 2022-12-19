import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/authentication/data/models/account_user.dart';
import 'package:gaude/src/features/profile/logic/repositories/account_repository.dart';
import 'package:gaude/src/shared/shared.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(AccountRepository repository)
      : _repository = repository,
        super(const AccountState.initial());

  final AccountRepository _repository;

  Future<void> getAccount(String id) async {
    emit(const AccountState.loading());
    final result = await _repository.getAccount(id);
    result.when<void>(
      (account) {
        if (account == null) {
          emit(const AccountState.notFound());
          return;
        }
        emit(AccountState.loaded(account));
      },
      failure: (failure) => emitFailure(AccountState.failed(failure), failure),
    );
  }

  Future<void> saveAccount(AccountUser account) async {
    emit(const AccountState.loading());
    final result = await _repository.saveAccount(account);
    result.when<void>(
      (_) => getAccount(account.id),
      failure: (failure) => emitFailure(AccountState.failed(failure), failure),
    );
  }

  Future<void> deleteAccount(AccountUser account) async {
    emit(const AccountState.loading());
    final result = await _repository.deleteAccount(account.id);
    result.when<void>(
      (_) => getAccount(account.id),
      failure: (failure) => emitFailure(AccountState.failed(failure), failure),
    );
  }

  Future<void> backupAccountData(AccountUser account) async {
    final result = await _repository.backup(account);
    result.when(
      (data) => emit(AccountState.loaded(account)),
      failure: (failure) => emitFailure(AccountState.failed(failure), failure),
    );
  }
}
