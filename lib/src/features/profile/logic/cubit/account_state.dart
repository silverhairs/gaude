part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = _Loading;
  const factory AccountState.loaded(Account account) = _Loaded;
  const factory AccountState.failedToLoad(Failure failure) = _Failed;
  const factory AccountState.notFound() = _NotFound;
  const factory AccountState.failedToSave(Failure failure) = _FailedToSave;
}
