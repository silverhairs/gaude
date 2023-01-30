import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

import 'mocks/app_settings.dart';
import 'mocks/database.dart';
import 'mocks/firebase.dart';

part 'injector.g.dart';

abstract class TestInjector {
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
  @Register.singleton(OpenAppSettings, from: MockOpenAppSettings)
  @Register.singleton(
    NotificationsPermissionRepository,
    from: NotificationsPermissionRepositoryImpl,
  )
  @Register.singleton(NotificationPermissionCubit)
  @Register.singleton(HiveInterface, from: FakeHive)
  @Register.singleton(FirebaseCrashlytics, from: FakeCrashlytics)
  @Register.singleton(GoogleSignIn, from: MockGoogleSignIn)
  void registerAll();

  static void configure({
    required MockUser firebaseUser,
    required bool signedIn,
  }) {
    KiwiContainer()
      ..registerFactory((_) => Logger())
      ..registerSingleton<FirebaseAuth>(
        (_) => MockFirebaseAuth(mockUser: firebaseUser, signedIn: signedIn),
      )
      ..registerSingleton<FirebaseFirestore>((_) => FakeFirebaseFirestore());

    _$TestInjector().registerAll();
  }

  static void dispose() {
    KiwiContainer().clear();
  }
}
