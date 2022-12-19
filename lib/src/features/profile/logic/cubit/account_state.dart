part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = _Loading;
  const factory AccountState.loaded(AccountUser account) = _Loaded;
  const factory AccountState.failed(Failure failure) = _Failed;
  const factory AccountState.notFound() = _NotFound;
}
