import 'package:gaude/src/features/settings/data/models/app_settings.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class AppSettingsRepository {
  Future<Result<AppSettings>> getAppSettings();
  Future<Result<void>> saveAppSettings(AppSettings appSettings);
}
