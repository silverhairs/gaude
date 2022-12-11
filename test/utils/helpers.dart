import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/app/app.dart';
import 'package:gaude/src/di/inject.dart';
import 'package:gaude/src/features/features.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'mocks/authentication/mocks.dart';
import 'mocks/crash_report/mocks.dart';
import 'mocks/interfaces.dart';

Future<void> openMainPage(WidgetTester tester) async {
  await startAppWithMocks(
      runner: () async => await tester.pumpWidget(const App()),
      stubs: [
        CrashReportRepositoryStubs(),
      ]);

  await tester.pumpAndSettle(const Duration(seconds: 1));
}

Future<void> startAppWithMocks({
  AsyncCallback? runner,
  WidgetTester? tester,
  bool authenticated = true,
  List<StubsManager> stubs = const [],
}) async {
  assert(
    !(runner == null && tester == null),
    'Either runner or tester must be provided',
  );
  try {
    _injectMocks(stubs: stubs);
    // ignore: empty_catches
  } on ArgumentError {
    // An ArgumentError is thrown when the injector is already configured.
  }
  if (!authenticated) {
    AuthenticationRepositoryStubs(inject()).authStateChangesWithNull();
  } else {
    AuthenticationRepositoryStubs(inject()).authStateChangesWithAccount();
  }
  if (runner != null) {
    await runner();
    return;
  }
  await tester!.pumpWidget(const App());
  await tester.pumpAndSettle(const Duration(seconds: 1));
}

void _injectMocks({List<StubsManager> stubs = const []}) {
  final container = GetIt.instance;

  container
    ..registerFactory(Logger.new)
    ..registerFactory(BottomTabNavigationCubit.new);

// Authentication
  container
    ..registerSingleton<AuthenticationRepository>(
      MockAuthenticationRepository(),
    )
    ..registerSingleton<AccountCredentialRepository>(
      MockAccountCredentialRepository(),
    );
  AccountCredentialRepositoryStubs(inject()).setupStubs();
  AuthenticationRepositoryStubs(inject()).setupStubs();
  container.registerFactory(
    () => AuthenticationBloc(
      authenticationRepository: inject(),
      accountCredentialRepository: inject(),
    ),
  );

  // Crash Report
  container.registerSingleton<CrashReportRepository>(
    MockCrashReportRepository(),
  );

  // The statement below should always be at the end of the function
  for (var stub in stubs) {
    stub.setupStubs();
  }
}
