import 'package:gaude/src/features/onboarding/data/models/app_settings.dart';

abstract class AppSettingsDataSource {
  Future<AppSettings> getAppSettings();
  Future<void> saveAppSettings(AppSettings appSettings);
}
