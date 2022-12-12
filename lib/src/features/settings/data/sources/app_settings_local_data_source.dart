import 'package:gaude/src/features/settings/data/models/app_settings.dart';
import 'package:gaude/src/features/settings/data/sources/app_settings_data_source.dart';
import 'package:gaude/src/shared/shared.dart';

class AppSettingsLocalDataSource implements AppSettingsDataSource {
  const AppSettingsLocalDataSource(Database db) : _db = db;
  final Database _db;

  static Storage? _storage;
  static const _key = 'settings';
  static const _storageKey = 'app_settings';

  @override
  Future<AppSettings> getAppSettings() async {
    try {
      final storage = _storage ??= await _db.getStorage(_storageKey);
      final settings = await storage.read(_key);
      if (settings == null || settings.isEmpty) {
        return AppSettings.initial();
      }

      return AppSettings.fromJson(settings);
    } on DatabaseException {
      rethrow;
    } catch (e, s) {
      throw DataSourceException('Failed to get app settings: $e\n$s');
    }
  }

  @override
  Future<void> saveAppSettings(AppSettings appSettings) async {
    try {
      final storage = _storage ??= await _db.getStorage(_storageKey);
      await storage.write(_key, appSettings.toJson());
    } on DatabaseException {
      rethrow;
    } catch (e, s) {
      throw DataSourceException('Failed to get app settings: $e\n$s');
    }
  }
}
