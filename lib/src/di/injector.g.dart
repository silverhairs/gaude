// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void registerAll() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => BottomTabNavigationCubit())
      ..registerSingleton<Database>((c) => HiveDatabase(c<HiveInterface>()))
      ..registerSingleton((c) => LocalAuthentication())
      ..registerSingleton<AppLockRepository>(
          (c) => AppLockRepositoryImpl(c<LocalAuthentication>()))
      ..registerSingleton((c) => AppLockCubit(c<AppLockRepository>()))
      ..registerSingleton<AppSettingsDataSource>(
          (c) => AppSettingsLocalDataSource(c<Database>()))
      ..registerSingleton<AppSettingsRepository>(
          (c) => AppSettingsRepositoryImpl(c<AppSettingsDataSource>()))
      ..registerSingleton((c) => AppSettingsCubit(c<AppSettingsRepository>()))
      ..registerSingleton<CrashReportDataSource>((c) =>
          CrashReportCrashlyticsDataSource(
              logger: c<Logger>(), crashlytics: c<FirebaseCrashlytics>()))
      ..registerSingleton<CrashReportService>((c) => CrashReportServiceImpl(
          dataSource: c<CrashReportDataSource>(), logger: c<Logger>()))
      ..registerSingleton<AccountCredentialDataSource>(
          (c) => GoogleAccountCredentialDataSource(c<GoogleSignIn>()))
      ..registerSingleton<AccountCredentialRepository>((c) =>
          AccountCredentialRepositoryImpl(c<AccountCredentialDataSource>()))
      ..registerSingleton<AuthenticationDataSource>(
          (c) => AuthenticationFirebaseDataSource(c<FirebaseAuth>()))
      ..registerSingleton<AuthenticationRepository>(
          (c) => AuthenticationRepositoryImpl(c<AuthenticationDataSource>()))
      ..registerSingleton((c) => AuthenticationBloc(
          accountCredentialRepository: c<AccountCredentialRepository>(),
          authenticationRepository: c<AuthenticationRepository>(),
          appSettingsRepository: c<AppSettingsRepository>()))
      ..registerSingleton<AccountDataSource>(
          (c) => AccountFirestoreDataSource(c<FirebaseFirestore>()))
      ..registerSingleton<AccountRepository>(
          (c) => AccountRepositoryImpl(c<AccountDataSource>()))
      ..registerSingleton((c) => AccountCubit(c<AccountRepository>()))
      ..registerSingleton((c) => OpenAppSettings())
      ..registerSingleton<NotificationsPermissionRepository>(
          (c) => NotificationsPermissionRepositoryImpl(c<OpenAppSettings>()))
      ..registerSingleton((c) =>
          NotificationPermissionCubit(c<NotificationsPermissionRepository>()));
  }
}
