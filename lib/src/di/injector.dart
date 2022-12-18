import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:gaude/src/di/di.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

abstract class Injector {
  Injector._();

  static void configure() {
    _container
      ..registerLazySingleton(Logger.new)
      ..registerLazySingleton(BottomTabNavigationCubit.new);

    _configureDatabase();
    _configureAppSettings();
    _configureFirebase();
    _configureCrashReport();
    _configureProfile();
    _configureAuthentication();
  }

  static final _container = GetIt.instance;

  static void _configureDatabase() {
    _container.registerSingleton<Database>(HiveDatabase());
  }

  static void _configureFirebase() {
    _container
      ..registerSingleton(FirebaseCrashlytics.instance)
      ..registerSingleton(FirebaseAuth.instance)
      ..registerSingleton(FirebaseFirestore.instance);
  }

  static void _configureCrashReport() {
    _container
      ..registerLazySingleton<CrashReportDataSource>(
        () => CrashReportCrashlyticsDataSource(
          logger: inject(),
          crashlytics: inject(),
        ),
      )
      ..registerLazySingleton<CrashReportRepository>(
        () => CrashReportRepositoryImpl(dataSource: inject(), logger: inject()),
      );
  }

  static void _configureAuthentication() {
    _container
      ..registerLazySingleton(GoogleSignIn.new)
      ..registerLazySingleton<AccountCredentialDataSource>(
        () => GoogleAccountCredentialDataSource(inject()),
      )
      ..registerLazySingleton<AccountCredentialRepository>(
        () => AccountCredentialRepositoryImpl(inject()),
      )
      ..registerLazySingleton<AuthenticationDataSource>(
        () => AuthenticationFirebaseDataSource(inject()),
      )
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(inject()),
      )
      ..registerLazySingleton(
        () => AuthenticationBloc(
          authenticationRepository: inject(),
          accountCredentialRepository: inject(),
          appSettingsRepository: inject(),
        ),
      );
  }

  static void _configureAppSettings() {
    _container
      ..registerLazySingleton<AppSettingsDataSource>(
        () => AppSettingsLocalDataSource(inject()),
      )
      ..registerLazySingleton<AppSettingsRepository>(
        () => AppSettingsRepositoryImpl(inject()),
      )
      ..registerLazySingleton(() => AppSettingsCubit(inject()));
  }

  static void _configureProfile() {
    _container
      ..registerLazySingleton<AccountDataSource>(
        () => AccountFirestoreDataSource(inject()),
      )
      ..registerLazySingleton<AccountRepository>(
        () => AccountRepositoryImpl(inject()),
      )
      ..registerLazySingleton(() => AccountCubit(inject()));
  }
}
