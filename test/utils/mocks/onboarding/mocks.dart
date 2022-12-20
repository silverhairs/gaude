import 'package:gaude/src/features/features.dart';

import '../interfaces.dart';

class AppSettingsMapBasedDataSource implements AppSettingsDataSource {
  var _storage = <String, dynamic>{};
  @override
  Future<AppSettings> getAppSettings() {
    if (_storage.isEmpty) {
      return Future.value(AppSettings.initial());
    }
    return Future.value(AppSettings.fromJson(_storage));
  }

  @override
  Future<void> saveAppSettings(AppSettings appSettings) async {
    _storage = appSettings.toJson();
  }
}

class AppSettingsDataSourceStubs implements StubsManager {
  const AppSettingsDataSourceStubs(this.dataSource);
  final AppSettingsDataSource dataSource;

  @override
  void setupStubs({bool success = true}) {
    onboardingCompleted();
  }

  void onboardingCompleted() {
    final settings = AppSettings.initial();
    dataSource.saveAppSettings(
      settings.copyWith(onboardingStatus: OnboardingStatus.completed),
    );
  }

  void onboardingNotCompleted() {
    final settings = AppSettings.initial();
    dataSource.saveAppSettings(
      settings.copyWith(onboardingStatus: OnboardingStatus.notStarted),
    );
  }
}
