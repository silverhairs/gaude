import 'package:gaude/src/features/authentication/data/models/account_credential.dart';
import 'package:gaude/src/features/authentication/logic/repositories/account_credential_repository.dart';
import 'package:gaude/src/features/authentication/logic/repositories/authentication_repository.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

import '../interfaces.dart';
import 'fakes.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockAccountCredentialRepository extends Mock
    implements AccountCredentialRepository {}

class FakeAccountCredential extends Fake implements AccountCredential {}

class AuthenticationRepositoryStubs implements StubsManager {
  AuthenticationRepositoryStubs(AuthenticationRepository repository)
      : _repository = repository {
    registerFallbackValue(FakeAccountCredential());
    setupStubs();
  }

  @override
  void setupStubs({bool success = true}) {
    if (success) {
      successfulLogin();
      successfulLogout();
      authStateChangesWithAccount();
    } else {
      failedLogin();
      failedLogout();
      authStateChangesWithNull();
    }
  }

  final AuthenticationRepository _repository;

  void successfulLogin() {
    when(() => _repository.login(any())).thenAnswer(
      (_) async => const Result(testUser),
    );
  }

  void failedLogin() {
    when(() => _repository.login(any())).thenAnswer(
      (_) async => Result.failure(
        Failure(
          const DataSourceException(
            'failed to login',
            stackTrace: StackTrace.empty,
          ),
          StackTrace.current,
        ),
      ),
    );
  }

  void successfulLogout() {
    when(() => _repository.logout()).thenAnswer(
      (_) async => const Result(null),
    );
  }

  void failedLogout() {
    when(() => _repository.logout()).thenAnswer(
      (_) async => Result.failure(
        Failure(
          const DataSourceException(
            'failed to logout',
            stackTrace: StackTrace.empty,
          ),
          StackTrace.current,
        ),
      ),
    );
  }

  void authStateChangesWithNull() {
    when(() => _repository.accountAuthStateChanges).thenAnswer(
      (_) => Stream.fromIterable([const Result(null)]),
    );
  }

  void authStateChangesWithAccount() {
    when(() => _repository.accountAuthStateChanges).thenAnswer(
      (_) => Stream.fromIterable([const Result(testUser)]),
    );
  }
}

class AccountCredentialRepositoryStubs implements StubsManager {
  AccountCredentialRepositoryStubs(AccountCredentialRepository repository)
      : _repository = repository {
    setupStubs();
  }

  @override
  void setupStubs({bool success = true}) {
    if (success) {
      successfulGetCredential();
      successfulInvalidateCredential();
    } else {
      failedGetCredential();
      failedInvalidateCredential();
    }
  }

  final AccountCredentialRepository _repository;

  void successfulGetCredential() {
    when(_repository.getCredential).thenAnswer(
      (_) async => Result(FakeAccountCredential()),
    );
  }

  void failedGetCredential() {
    when(_repository.getCredential).thenAnswer(
      (_) async => Result.failure(
        Failure(
          const DataSourceException(
            'failed to get credential',
            stackTrace: StackTrace.empty,
          ),
          StackTrace.current,
        ),
      ),
    );
  }

  void successfulInvalidateCredential() {
    when(_repository.invalidateCrendential).thenAnswer(
      (_) async => const Result(null),
    );
  }

  void failedInvalidateCredential() {
    when(_repository.invalidateCrendential).thenAnswer(
      (_) async => Result.failure(
        Failure(
          const DataSourceException(
            'failed to invalidate credential',
            stackTrace: StackTrace.empty,
          ),
          StackTrace.current,
        ),
      ),
    );
  }
}
