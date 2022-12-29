import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AccountCredentialRepository accountCredentialRepository,
    required AuthenticationRepository authenticationRepository,
    required AppSettingsRepository appSettingsRepository,
  })  : _authenticationRepository = authenticationRepository,
        _accountCredentialRepository = accountCredentialRepository,
        super(const _Initial()) {
    on<AuthenticationEvent>(_handleEvent);

    _authenticationRepository.accountAuthStateChanges.listen(
      // ignore: invalid_use_of_visible_for_testing_member
      (result) => emit(_getStateFromResult(result)),
    );
  }

  final AccountCredentialRepository _accountCredentialRepository;
  final AuthenticationRepository _authenticationRepository;

  Future<void> _handleEvent(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.loading());
    late final AuthenticationState state;
    if (event is AuthenticationLoginWithGoogle) {
      state = await _loginWithGoogle();
    } else if (event is AuthenticationLogout) {
      state = await _logout();
    }
    emit(state);
    if (state is _Failure) {
      addError(state.failure.error, state.failure.stackTrace);
    }
  }

  Future<AuthenticationState> _loginWithGoogle() async {
    final result = await _accountCredentialRepository.getCredential();
    return result.when<FutureOr<AuthenticationState>>(
      (credential) async {
        final authResult = await _authenticationRepository.login(credential);
        return authResult.when<AuthenticationState>(
          AuthenticationState.authenticated,
          failure: AuthenticationState.failed,
        );
      },
      failure: AuthenticationState.failed,
    );
  }

  Future<AuthenticationState> _logout() async {
    final result = await _accountCredentialRepository.invalidateCrendential();
    return result.when<FutureOr<AuthenticationState>>(
      (_) async {
        final authResult = await _authenticationRepository.logout();
        return authResult.when<AuthenticationState>(
          (_) => const AuthenticationState.unauthenticated(),
          failure: AuthenticationState.failed,
        );
      },
      failure: AuthenticationState.failed,
    );
  }

  AuthenticationState _getStateFromResult(Result<AccountUser?> result) {
    return result.when(
      (user) => user == null
          ? const AuthenticationState.unauthenticated()
          : AuthenticationState.authenticated(user),
      failure: AuthenticationState.failed,
    );
  }
}
