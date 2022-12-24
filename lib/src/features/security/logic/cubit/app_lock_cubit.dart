import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/security/logic/repositories/app_lock_repository.dart';
import 'package:gaude/src/shared/shared.dart';

part 'app_lock_cubit.freezed.dart';
part 'app_lock_state.dart';

class AppLockCubit extends Cubit<AppLockState> {
  AppLockCubit(AppLockRepository repository)
      : _repository = repository,
        super(const AppLockState.initial());

  final AppLockRepository _repository;

  Future<void> authenticate() async {
    final result = await _repository.authenticate();
    emit(result.when(
      (value) => const AppLockState.authenticated(),
      failure: AppLockState.failed,
    ));
  }

  Future<void> getSecurityTypes() async {}
}
