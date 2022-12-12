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
import 'mocks/settings/mocks.dart';

Future<void> openMainPage(WidgetTester tester) async {
  await startAppWithMocks(
      runner: () async => await tester.pumpWidget(const App()),
      stubs: [CrashReportRepositoryStubs()]);

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
    _configureInjector(stubs: stubs);
    // ignore: empty_catches
  } on ArgumentError {
    // An ArgumentError is thrown when the injector is already configured.
  }
  if (!authenticated) {
    AppSettingsDataSourceStubs(inject()).onboardingNotCompleted();
    AuthenticationRepositoryStubs(inject()).authStateChangesWithNull();
  } else {
    AppSettingsDataSourceStubs(inject()).onboardingCompleted();
    AuthenticationRepositoryStubs(inject()).authStateChangesWithAccount();
  }
  if (runner != null) {
    await runner();
    return;
  }
  await tester!.pumpWidget(const App());
  await tester.pumpAndSettle(const Duration(seconds: 1));
}

/// Configures the injector for testing.
///
/// The configurations in this function must stay in this order. Moving one registration
/// to another place may cause unresolved dependency exceptions in the test. When
/// registering a new depedenency, make sure you are not doing it after another
/// dependency that depends on it. For example:
///
/// ```dart
/// // Considering the two classes A and B such as:
/// class A {
///  const A(this.b);
///  final B b;
/// }
///
/// class B {}
///
/// // When registering A and B in [_configureInjector], the order must be:
/// container
///   ..registerSingleton<B>(B())
///   ..registerSingleton<A>(A(inject()));
/// ```
///
/// Another thing to keep in mind is to always register [Bloc] and [Cubit] objects
/// as factories so that a new instance gets created for each test, this will prevent running
/// into issues where a bloc or cubit gets closed by a previous test and is not able to
/// emit new states.
///
void _configureInjector({List<StubsManager> stubs = const []}) {
  final container = GetIt.instance;

  container
    ..registerFactory(Logger.new)
    ..registerFactory(BottomTabNavigationCubit.new);

  // Settings
  container
    ..registerSingleton<AppSettingsDataSource>(AppSettingsMapBasedDataSource())
    ..registerSingleton<AppSettingsRepository>(
      AppSettingsRepositoryImpl(inject()),
    )
    ..registerFactory(() => AppSettingsCubit(inject()));

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
        appSettingsRepository: inject()),
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
