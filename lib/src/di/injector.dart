import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(BottomTabNavigationCubit)
  @Register.singleton(Database, from: HiveDatabase)
  @Register.singleton(LocalAuthentication)
  @Register.singleton(AppLockRepository, from: AppLockRepositoryImpl)
  @Register.singleton(AppLockCubit)
  @Register.singleton(AppSettingsDataSource, from: AppSettingsLocalDataSource)
  @Register.singleton(AppSettingsRepository, from: AppSettingsRepositoryImpl)
  @Register.singleton(AppSettingsCubit)
  @Register.singleton(
    CrashReportDataSource,
    from: CrashReportCrashlyticsDataSource,
  )
  @Register.singleton(CrashReportService, from: CrashReportServiceImpl)
  @Register.singleton(
    AccountCredentialDataSource,
    from: GoogleAccountCredentialDataSource,
  )
  @Register.singleton(
    AccountCredentialRepository,
    from: AccountCredentialRepositoryImpl,
  )
  @Register.singleton(
    AuthenticationDataSource,
    from: AuthenticationFirebaseDataSource,
  )
  @Register.singleton(
    AuthenticationRepository,
    from: AuthenticationRepositoryImpl,
  )
  @Register.singleton(AuthenticationBloc)
  @Register.singleton(AccountDataSource, from: AccountFirestoreDataSource)
  @Register.singleton(AccountRepository, from: AccountRepositoryImpl)
  @Register.singleton(AccountCubit)
  @Register.singleton(OpenAppSettings)
  @Register.singleton(
    NotificationsPermissionRepository,
    from: NotificationsPermissionRepositoryImpl,
  )
  @Register.singleton(NotificationPermissionCubit)
  void registerAll();

  static void configure(AppConfig config) {
    _container
      ..registerInstance<HiveInterface>(Hive)
      ..registerFactory((_) => Logger(level: config.logLevel))
      ..registerSingleton((_) => GoogleSignIn());
    _configureFirebase();
    _$Injector().registerAll();
  }

  static final _container = KiwiContainer();

  static void _configureFirebase() {
    _container
      ..registerInstance(FirebaseCrashlytics.instance)
      ..registerInstance(FirebaseAuth.instance)
      ..registerInstance(FirebaseFirestore.instance);
  }

  void dispose() {
    _container.clear();
  }
}
